local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('automotive.pullpiri', 'eclipse-pullpiri') {
  settings+: {
    description: "",
    name: "Eclipse Pullpiri",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('pullpiri') {
      description: "Eclipse Pullpiri provides efficient vehicle service orchestrator framework to realize the potential benefits of cloud native technologies for in-vehicle services and applications.",
      topics+: [
        "pullpiri",
        "automotive",
        "containers",
        "orchestration"
      ],
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      has_discussions: true,
      has_issues: true,
      has_projects: false,
      has_wiki: true,
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
        },
      ],
      secrets: [
        orgs.newRepoSecret('HARBOR_PASSWORD') {
          value: "12345678",
        },
      ],
    },
  ],
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}
