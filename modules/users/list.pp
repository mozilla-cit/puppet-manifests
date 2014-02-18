class users::list {
#TODO: DRY on group really being $name

  $defaultgroups = ['users']
  $admingroups = ['admin', 'sudo']

  @account { 'jp':
    group => 'jp',
    fullname => 'JP Schneider',
    ingroups => $admingroups,
    authorizedkey => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCXzqzmUYfw16f+JQ55/T9fZ7cSpyHdvUdd6SX5sPhJvI/NDLXV0Uy2khwRAJx/V8r/ATq+J8aB1oRfMVtpkesYXFNRc3WyYBvRZ+jq9ZlSM6/V5uYUGDkrkxicYX2mhl7NH5CZYmxI8RcyT0gqM+RlbYB5Z+VlNJMG8QVPyJayQ7NuKBSP7UZPMTPPxvnUMf0Q2dma7j8HIRX70Q3BiJbcVQ3gxA2dJwLOK+szALk/wtUTSRlaW9gwGtaPi2WBqqJTStTzibVavWvwPwRaI1QqYG8S/CpYHWWPzjMyypJMbpxzKu2ePv7xzM5jtdvWP3rd7eKM+97vDxwb81e6k8bJ',
    keycomment => 'GitHub@jdotpz',
  }

  }