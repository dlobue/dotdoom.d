(after! org-jira
 (setq jiralib-url "https://revupsoftware.atlassian.net")
 (setq org-jira-use-status-as-todo t)

 (add-hook 'org-jira-mode-hook
           (lambda ()
             (display-line-numbers-mode -1)
             ))

 (after! org
         (add-to-list 'org-todo-keywords
                      '(sequence "REOPENED(d)" "OPEN(o)" "IN-PROGRESS(p)" "IN-REVIEW(r)"
                                 "|" "RESOLVED(s)" "CLOSED(c)")
                      t))

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
         (:jql "project = REVUP AND resolution = Unresolved AND assignee in (currentUser()) order by status, id DESC"
               :filename "REVUP")
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
