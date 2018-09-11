(require 'ox-publish)
(setq org-publish-project-alist
      `(("posts-notes"
	 :base-directory ,(getenv "POSTS_BASE_DIR")
	 :base-extension "org"
	 :publishing-directory ,(getenv "POSTS_TEST_DIR")
	 :recursive  t
	 :publishing-function org-html-publish-to-html
	 :headline-levels 4 
	 :auto-preamble  t)
	("posts-static"
	 :base-directory ,(getenv "POSTS_BASE_DIR")
	 :base-extension "css\\|jpg\\|png\\|js"
	 :publishing-directory ,(getenv "POSTS_TEST_DIR")
	 :recursive t
	 :publishing-function org-publish-attachment)
	("posts-notes-remote"
	 :base-directory ,(getenv "POSTS_BASE_DIR")
	 :publishing-directory ,(getenv "POSTS_PUBLISH_DIR")
	 :recursive t
	 :publishing-function org-html-publish-to-html)
	("posts-static-remote"
	 :base-directory ,(getenv "POSTS_BASE_DIR")
	 :base-extension "css\\|jpg\\|png\\|js"
	 :publishing-directory ,(getenv "POSTS_PUBLISH_DIR")
	 :recursive t
	 :publishing-function org-publish-attachment)
	("posts"
	 :components ("posts-notes" "posts-static"))
	("posts-push"
	 :components ("posts-notes-remote" "posts-static-remote"))))

(load "posts.el")
