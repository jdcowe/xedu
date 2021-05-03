<?php

Class Course extends Controller {
    function getCourses($f3, $params) {
       $courses=new DB\SQL\Mapper($f3->get('DB'),"course");
       $list = array_map(array($courses, 'cast'),$courses->find());
       echo json_encode($list);
    }

    function getMostPopular($f3, $params) {
        $courses=new DB\SQL\Mapper($f3->get('DB'),"course");
        $list = array_map(array($courses, 'cast'),$courses->find(NULL, array(
            'order'=>'views',
            'limit'=>'7'
        )));
        echo json_encode($list);
    }

    function getTopRated($f3, $params) {
        $courses=new DB\SQL\Mapper($f3->get('DB'),"course");
        $list = array_map(array($courses, 'cast'),$courses->find(NULL, array(
            'order'=>'rating',
            'limit'=>'7'
        )));
        echo json_encode($list);
    }

    function getCourse($f3, $params) {
        $course=new DB\SQL\Mapper($f3->get('DB'),"courseContent");
        $array = array_map(array($course, 'cast'), $course->find());
        echo json_encode($array);
    }

    function getQuestions($f3, $params) {
        $questions=new DB\SQL\Mapper($f3->get('DB'),"question");
        $array = array_map(array($questions, 'cast'), $questions->find());
        echo json_encode($array);
    }

    function getScores($f3, $params) {
        $scores=new DB\SQL\Mapper($f3->get('DB'),"scores");
        $list = array_map(array($scores, 'cast'),$scores->find(NULL, array(
            'order'=>'score'
        )));
        echo json_encode($list);
    }

    function createCourse($f3, $params) {
        $course=new DB\SQL\Mapper($f3->get('DB'),"course");
        $course->copyfrom('POST');
        $course->save();
        echo json_encode($f3->get('POST'));

    }
}