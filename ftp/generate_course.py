import json
import pandas as pd
skipped_num = 0
raw_courses = pd.DataFrame(
    columns=["course_ID", "course_name", "semester", "teacher", "department", "course_ID2"])

with open("./common.json") as reader:
    obj = json.loads(reader.read())
    for el in obj.values():
        for course in el:
            try:
                if course["courseName"] == "[沒有名稱]" or course["teacher"] == "不明教師":
                    raise KeyError
                row = [course["waterNum"], course["courseName"], "112-1",
                       course["teacher"], course["dpt"], course["courseID"]]
                raw_courses.loc[len(raw_courses)] = row
            except KeyError:
                skipped_num += 1
                continue

with open("./department.json") as reader:
    obj = json.loads(reader.read())
    for dpt,  el in obj.items():
        for course in el:
            try:
                if course["courseName"] == "[沒有名稱]" or course["teacher"] == "不明教師":
                    raise KeyError
                row = [course["waterNum"], course["courseName"], "112-1",
                       course["teacher"], dpt, course["courseID"]]
                raw_courses.loc[len(raw_courses)] = row
            except KeyError:
                skipped_num += 1
                continue
with open("./general.json") as reader:
    obj = json.loads(reader.read())
    for course in obj:
        try:
            if course["courseName"] == "[沒有名稱]" or course["teacher"] == "不明教師":
                raise KeyError
            row = [course["waterNum"], course["courseName"], "112-1",
                   course["teacher"], course["dpt"], course["courseID"]]
            raw_courses.loc[len(raw_courses)] = row
        except KeyError:
            skipped_num += 1
            continue
print("skipped course:", skipped_num)

raw_courses.to_csv("raw_courses.csv")

instructors = pd.DataFrame(
    pd.Categorical(raw_courses["teacher"], ordered=False).categories, columns=["instructor_name"])

instructors.to_csv("INSTRUCTOR.csv")

courses = pd.DataFrame(
    {"course_ID": raw_courses["course_ID"], "course_name": raw_courses["course_name"], "semester": raw_courses["semester"], "department_ID": raw_courses["department"]})
courses = courses.drop_duplicates(subset="course_ID", keep='first')
courses.to_csv("COURSE.csv")

offer = pd.DataFrame({"course_ID": raw_courses["course_ID"], "instructor_ID": pd.Categorical(
    raw_courses["teacher"], ordered=False).codes})

offer.to_csv("OFFER_COURSE.csv")
