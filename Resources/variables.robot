*** Variables ***
#*** WEB VARIABLES ***
@{URL}          http://thr-phase-2-staging.bliimo.com/admin/login
${BROWSER}      chromium
${TITLE}        Login | The Huddle Room
&{USER_CREDENTIALS}     email='admin@thr.com'       password='Password@123'
${LOGIN_BUTTON}     //body/div[@id='wrapper']/div[@id='content_wrapper']/div[@id='active_admin_content']/div[@id='login']/form[@id='session_new']/fieldset[2]/ol[1]/li[1]/input[1]