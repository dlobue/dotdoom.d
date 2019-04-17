(setq jiralib-url "https://revupsoftware.atlassian.net")
(setq org-jira-use-status-as-todo t)

(add-hook 'org-jira-mode-hook
          (lambda ()
            (add-to-list 'org-todo-keywords
                         '(sequence "REOPENED(d)" "OPEN(o)" "IN-PROGRESS(p)" "IN-REVIEW(r)"
                                    "|" "RESOLVED(s)" "CLOSED(c)")
                         t)))

; enable line wrapping
(add-hook 'org-jira-mode-hook 'visual-line-mode)

(defconst org-jira-progress-issue-flow
  '(("Open" . "Start Progress")
    ("In Progress" . "Start Review")
    ("In Review" . "Resolve Issue")
    ("Resolved" . "Close Issue")
    ("Closed" . "Reopen Issue")))
