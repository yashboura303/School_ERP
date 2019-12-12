$(document).on('submit', '#add_exam_form', function(e) {

        e.preventDefault();
        $.ajax({
            type: 'POST',
            url: '{% url 'addExamForm' %}',
            data: {
                exam_type: $('#exam_type').val(),
                total_marks: $('#total_marks').val(),
                csrfmiddlewaretoken: '{{ csrf_token }}'

            },
            success: function(e) {
                alert("Exam added!");
            },
            error: function() {
                alert("Fail");
            }

        });
    });