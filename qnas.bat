@echo off
setlocal enabledelayedexpansion

REM Define the questions and answers
set questions[0]=What is the capital of France?
set answers[0]=A. Paris
set answers[1]=B. London
set answers[2]=C. Berlin
set correct[0]=A

set questions[1]=Which planet is known as the Red Planet?
set answers[3]=A. Jupiter
set answers[4]=B. Mars
set answers[5]=C. Venus
set correct[1]=B

set questions[2]=What is the powerhouse of the cell?
set answers[6]=A. Nucleus
set answers[7]=B. Mitochondria
set answers[8]=C. Chloroplast
set correct[2]=B

set /a total_questions=3
set /a correct_answers=0

REM Ask each question and check the answer
for /l %%i in (0,1,%total_questions%) do (
    set /a question_number=%%i+1
    set /a answer_index=%%i*3
    echo Question !question_number!: !questions[%%i]!
    echo !answers[%answer_index%]!
    echo !answers[%answer_index%+1]!
    echo !answers[%answer_index%+2]!
    set /p user_answer=Your answer (A, B, or C): 
    if /i "!user_answer!"=="!correct[%%i]!" (
        echo Correct!
        set /a correct_answers+=1
    ) else (
        echo Incorrect. The correct answer is !correct[%%i]!
    )
    echo.
)

echo You answered !correct_answers! out of %total_questions% questions correctly.
pause

REM Create a CSV file with the correct answers
set csv_file=correct_answers.csv
echo Question,Correct Answer> %csv_file%
for /l %%i in (0,1,%total_questions%) do (
    set /a question_number=%%i+1
    echo "!questions[%%i]!", "!correct[%%i]!" >> %csv_file%
)

echo CSV file with correct answers created: %csv_file%

