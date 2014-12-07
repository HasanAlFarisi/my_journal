$("#modal_background").fadeTo(500, 5);
$(".show_modal_add_journal").html("<%= j(render partial: "admin/journals/form", locals: {admin_journal: @admin_journal, admins: @admins}) %>")