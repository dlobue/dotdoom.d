(after! org-jira
 (setq jiralib-url "https://sentinelone.atlassian.net")
 (setq org-jira-use-status-as-todo t)

 (add-hook 'org-jira-mode-hook
           (lambda ()
             (display-line-numbers-mode -1)
             ))


 ; enable line wrapping
 (add-hook 'org-jira-mode-hook 'visual-line-mode)

 (defconst org-jira-progress-issue-flow
           '(("Open" . "Start Progress")
             ("In Progress" . "Start Review")
             ("In Review" . "Resolve Issue")
             ("Resolved" . "Close Issue")
             ("Closed" . "Reopen Issue")))



 (setq org-jira-custom-jqls
       '(
         (:jql "project = PLAT AND resolution = Unresolved AND assignee in (currentUser()) order by status, id DESC"
               :filename "PLAT")
         ; (:jql " project IN (EX, AHU) and createdDate < '2019-01-01' order by created DESC "
         ;       :limit 10
         ;       :filename "last-years-work")
         ; (:jql " project IN (EX, AHU) and createdDate >= '2019-01-01' order by created DESC "
         ;       :limit 10
         ;       :filename "this-years-work")
         ; (:jql "
         ; project IN (EX, AHU)
         ; and status IN ('To Do', 'In Development')
         ; AND (labels = EMPTY or labels NOT IN ('FutureUpdate'))
         ; order by priority, created DESC "
         ;       :limit 20
         ;       :filename "ex-ahu-priority-items")
         ))
 )


(setq jiralib2-url              "https://sentinelone.atlassian.net"
      jiralib2-auth             'token
      jiralib2-user-login-name  "dominicl@sentinelone.com"
      jiralib2-token            "6TIbPqHSt2YYJ0YzaOd9656D"
      ; jiralib2-token            (password-store-get "sentinelone/sentinelone.atlassian.net/gojira")

      ejira-org-directory       "~/jira"
      ejira-projects            '("PLAT")

      ejira-priorities-alist    '(("Priority 1" . ?A)
                                  ("Priority 2" . ?B)
                                  ("Priority 3" . ?C)
                                  ("Priority 4" . ?D)
                                  ("Priority 5" . ?D)
                                  ("Highest" . ?E)
                                  ("High"    . ?F)
                                  ("Medium"  . ?G)
                                  ("Not Set"  . ?H))
      ejira-todo-states-alist   '(("To Do"       . 1)
                                  ("Paused" . 2)
                                  ("In Triage" . 3)
                                  ("In Progress" . 4)
                                  ("Done"        . 5)))


(setq ejira-update-jql-unresolved-fn #'ejira-jql-my-unresolved-project-tickets)

(add-hook 'jiralib2-post-login-hook #'ejira-guess-epic-sprint-fields)
(setq org-id-track-globally t
      org-priority-highest ?A
      org-priority-lowest ?H
      org-priority-default ?C)

;; need to make sure pass is loaded first
(after! (ejira org)
        (setq org-todo-keywords
                     '((sequence "TODO(b)" ;; backlog?
                                 "PAUSED(p)"
                                 "TRIAGE(t)"
                                 "IN PROGRESS(i)"
                                 "|"
                                 "DONE(d)"))
                     )

               ;; Tries to auto-set custom fields by looking into /editmeta
               ;; of an issue and an epic.

               ;; They can also be set manually if autoconfigure is not used.
               ;; (setq ejira-sprint-field       'customfield_10001
               ;;       ejira-epic-field         'customfield_10002
               ;;       ejira-epic-summary-field 'customfield_10004)

               (require 'ejira-agenda)

               ;; Make the issues visisble in your agenda by adding `ejira-org-directory'
               ;; into your `org-agenda-files'.
               (add-to-list 'org-agenda-files ejira-org-directory)

               ;; Add an agenda view to browse the issues that
               (org-add-agenda-custom-command
                 '("j" "My JIRA issues"
                   ((ejira-jql "resolution = unresolved and assignee = currentUser()"
                               ((org-agenda-overriding-header "Assigned to me"))))))
 )
