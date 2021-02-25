<?php

class Quiz extends Controller{
    function getQuiz($f3, $params) {
        $quizID = $params['quizid'];
        header('Content-Type: application/json');
        $data = array(
            'id'=>$quizID,
            'questions'=>array(
                array(
                    'id'=>1,
                    'questionText'=>'What is this?',
                    'correctAnswer'=>3,
                    'answers'=>array(
                        array(
                            'id'=>1,
                            'text'=>'A Door',
                            'correct'=>FALSE
                        ),
                        array(
                            'id'=>2,
                            'text'=>'A Song',
                            'correct'=>FALSE
                        ),
                        array(
                            'id'=>3,
                            'text'=>'A Question',
                            'correct'=>TRUE
                        ),
                        array(
                            'id'=>4,
                            'text'=>'An Essay',
                            'correct'=>FALSE
                        )
                    )
                )
            )
        );

        echo json_encode($data);
    }

    function score($f3, $params) {
        $quizID = $params['quizid'];
        header('Content-Type: application/json');
        $data = array(
            'totalTime'=>3.7,
            'percentage'=>95,
            'points'=>375
        );
        echo json_encode($data);
    }
}