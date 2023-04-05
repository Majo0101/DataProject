import random
import pandas as pd
from sqlalchemy import create_engine
from sqlalchemy import text
from faker import Faker
from faker_vehicle import VehicleProvider


class MySQL:
    def __init__(self, hostname, port, dbname, uname, pwd):
        self.engine = None
        self.connection = None
        self.__hostname = hostname
        self.__port = port
        self.__dbname = dbname
        self.__uname = uname
        self.__pwd = pwd

    def connect(self):
        self.engine = create_engine(
            f'mysql://{self.__uname}:{self.__pwd}@{self.__hostname}:{self.__port}/{self.__dbname}'
        )

        try:
            self.connection = self.engine.connect()
            print('Connection successful!')
            return True
        except Exception as e:
            print(f'Error: {e}')
            return False

    def disconnect(self):
        try:
            self.engine.dispose()
            print('Disconnection successful!')
        except Exception as e:
            print(f'Error: {e}')
            return False


class FakerData:
    def __init__(self, engine, connection):
        self.__engine = engine
        self.__connection = connection
        self.__fake = Faker()
        self.__fake.add_provider(VehicleProvider)

    def employees(self, count):
        # TODO APPEND TO THE EXISTING NAMES
        employee_age = [random.randint(27, 50) for y in range(count)]
        employee_first = [self.__fake.unique.first_name() for i in range(count)]
        assert len(set(employee_first)) == len(employee_first)
        employee_last = [self.__fake.unique.last_name() for x in range(count)]
        assert len(set(employee_last)) == len(employee_last)

        dataframe = pd.DataFrame({
            'fname': employee_first,
            'lname': employee_last,
            'age': employee_age,
            'email': ''
        })

        for index, row in dataframe.iterrows():
            email = row['fname'] + '.' + row['lname'] + '@' + self.__fake.domain_name()
            dataframe.at[index, 'email'] = email.lower()

        try:
            dataframe.to_sql(con=self.__engine, name='Employees', if_exists='append', index=False)
            print('Employees OK')
        except Exception as e:
            print(f'Error: {e}')

    def cars_fuels(self):
        # TODO FOR EMPTY TABLE
        select_cars = "SELECT COUNT(*) FROM Cars"
        select_fuels = "SELECT COUNT(*) FROM Fuels"
        check = "SELECT COUNT(*) FROM Cars_Fuels"

        try:
            select_cars = self.__connection.execute(text(select_cars)).fetchall()[0][0]
            select_fuels = self.__connection.execute(text(select_fuels)).fetchall()[0][0]
            check = self.__connection.execute(text(check)).fetchall()[0][0]
        except Exception as e:
            print(f'Error: {e}')

        if int(check) == 0:
            if int(select_cars) != 0 and int(select_fuels) != 0:
                cars_id = [y for y in range(1, int(select_cars) + 1)]
                fuels_id = [random.randint(1, int(select_fuels)) for y in range(1, int(select_cars) + 1)]

                dataframe = pd.DataFrame({
                    'cars_id': cars_id,
                    'fuels_id': fuels_id
                })

                try:
                    dataframe.to_sql(con=self.__engine, name='Cars_Fuels', if_exists='append', index=False)
                    print('Cars_Fuels OK')
                except Exception as e:
                    print(f'Error: {e}')
            else:
                print('Cars OR Fuels - NO RECORDS')
        else:
            print('Cars OR Fuels - NOT EMPTY')

    def employees_jobs(self):
        # TODO FOR 5 RECORDS TABLE
        select_employees = "SELECT COUNT(*) FROM Employees"
        select_jobs = "SELECT COUNT(*) FROM Jobs"
        check = "SELECT COUNT(*) FROM Employees_Jobs"

        try:
            select_employees = self.__connection.execute(text(select_employees)).fetchall()[0][0]
            select_jobs = self.__connection.execute(text(select_jobs)).fetchall()[0][0]
            check = self.__connection.execute(text(check)).fetchall()[0][0]
        except Exception as e:
            print(f'Error: {e}')

        if int(check) == 5:
            if int(select_employees) != 0 and int(select_jobs) != 0:
                employees_id = [y for y in range(6, int(select_employees) + 1)]
                jobs_id = [random.randint(1, int(select_jobs)) for y in range(6, int(select_employees) + 1)]

                dataframe = pd.DataFrame({
                    'employees_id': employees_id,
                    'jobs_id': jobs_id
                })

                try:
                    dataframe.to_sql(con=self.__engine, name='Employees_Jobs', if_exists='append', index=False)
                    print('Employees_Jobs OK')
                except Exception as e:
                    print(f'Error: {e}')
            else:
                print('Employees_Jobs - NO RECORDS')
        else:
            print('Employees_Jobs - MUST BE DEFINED FIRST 5 RECORDS')

    def employees_mobile_plans(self):
        # TODO FOR EMPTY TABLE
        select_employees = "SELECT COUNT(*) FROM Employees"
        select_mobile_plans = "SELECT COUNT(*) FROM MobilePlans"
        check = "SELECT COUNT(*) FROM Employees_MobilePlans"

        try:
            select_employees = self.__connection.execute(text(select_employees)).fetchall()[0][0]
            select_mobile_plans = self.__connection.execute(text(select_mobile_plans)).fetchall()[0][0]
            check = self.__connection.execute(text(check)).fetchall()[0][0]
        except Exception as e:
            print(f'Error: {e}')

        if int(check) == 0:
            if int(select_employees) != 0 and int(select_mobile_plans) != 0:
                employees_id = [y for y in range(1, int(select_employees) + 1)]
                mobile_plans_id = [random.randint(1, int(select_mobile_plans)) for y in
                                   range(1, int(select_employees) + 1)]

                dataframe = pd.DataFrame({
                    'employees_id': employees_id,
                    'mobilePlans_id': mobile_plans_id
                })

                try:
                    dataframe.to_sql(con=self.__engine, name='Employees_MobilePlans', if_exists='append', index=False)
                    print('Employees_MobilePlans OK')
                except Exception as e:
                    print(f'Error: {e}')
            else:
                print('Employees OR MobilePlans -  NO RECORDS')
        else:
            print('Employees OR MobilePlans -  NOT EMPTY')

    def trip_log(self, count, months, year):
        # TODO APPEND TO THE EXISTING TripLog
        select_employees = "SELECT COUNT(*) FROM Employees"
        select_cars = "SELECT COUNT(*) FROM Cars"

        try:
            select_employees = self.__connection.execute(text(select_employees)).fetchall()[0][0]
            select_cars = self.__connection.execute(text(select_cars)).fetchall()[0][0]
        except Exception as e:
            print(f'Error: {e}')

        employees_id = [random.randint(1, int(select_employees)) for y in range(1, int(count) + 1)]
        cars_id = [random.randint(1, int(select_cars)) for y in range(1, int(count) + 1)]
        months_id = [random.randint(1, int(months)) for y in range(1, int(count) + 1)]
        years_id = [year for y in range(1, int(count) + 1)]
        mileage = [random.randint(30, 500) for y in range(1, int(count) + 1)]

        dataframe = pd.DataFrame({
            'employees_id': employees_id,
            'cars_id': cars_id,
            'months_id': months_id,
            'years_id': years_id,
            'mileage': mileage
        })

        try:
            dataframe.to_sql(con=self.__engine, name='TripLog', if_exists='append', index=False)
            print('Employees_MobilePlans OK')
        except Exception as e:
            print(f'Error: {e}')


if __name__ == "__main__":
    sql = MySQL(hostname, port, dbname, uname, pwd)

    if sql.connect():
        data = FakerData(sql.engine, sql.connection)

        data.employees(95)
        data.cars_fuels()
        data.employees_jobs()
        data.employees_mobile_plans()
        data.trip_log(800, 12, 1)

        sql.disconnect()