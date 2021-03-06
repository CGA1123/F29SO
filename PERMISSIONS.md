# System Permissions

### Permissions

This file contains a record of all permissions registered in the system.

| Permission String | Action | Description |
| ----------------- | ------ | ----------- |
| `users.invite` | `InvitationsController#new` | Allows user to access a user invitation form |
| `users.invite` | `InvitationsController#create` | Allows user to create a user invitation |
| `users.invite.<group_id>` | `InvitationsController#create` | Allows a user to invite users into the group with `id` of `group_id` |
| `users.invite.delete` | `InvitationsController#destroy` | Allows a user to delete any invitation |
| `profile.edit` | `ProfilesController#edit` & `ProfilesController#update` | Allows a user to edit his own profile |
| `profile.edit.others` | `ProfilesController#edit` & `ProfilesController#update` | Allows a user to edit others profile (A user with this permission can **also** edit his own profile) |
| `profile.skills.manage` | `UserSkill#search`, `#create`, `#edit`, `#update`, & `UserSkill#destroy` | Allows a user to edit their skills set |
| `profile.skills.manage.others` | `UserSkill#search`, `#create`, `#edit`, `#update`, & `UserSkill#destroy` | Allows a user to edit other users' skills set |
| `projects.view` | `ProjectsController#show` & `ProjectRolePermissionsController#index` | Gives permission to view a project |
| `projects.edit` | `ProjectsController#update` & `ProjectsController#edit` | Gives permission to edit a project |
| `projects.delete` | `ProjectsController#destroy` | Gives permission to delete a project |
| `projects.create` | `ProjectsController#create` | Gives permission to create a new project |
| `projects.roles.manage` |  | Allows a user to manage a ProjectRole, its locations, users, & permissions |
| `projects.roles.manage.users` | `ProjectRoleUsersController` | Allows a user to manage a ProjectRoles users|
| `projects.roles.manage.permissions` | `ProjectRolePermissionsController` | Allows a user to manage a ProjectRoles permissions |
| `projects.roles.manage.locations` | `ProjectLocationsController` | Allows a user to manage a Projects locations |
| `admin.groups.view` | `GroupsController#show, #index` & `GroupUsersController#index`  | Allows user to views groups (And group users) |
| `admin.groups.manage` | `GroupsController#create, #destroy` & `GroupUsersController#create, #search, #destroy` & `GroupPermissionsController#create` & `#destroy` | Allows a user to manage groups (creation/deletion), as well as group users (addition, removal), and group permissions (adding/removing) |
| `admin.groups.manage.users` | `GroupUsersController#create, #destroy #search` | Allows user to manage users within a group (addition, removal) |
| `admin.groups.manage.permissions` | `GroupPermissionsController#create` & `#destroy` | Allows user to manage permissions that a group has |
| `admin.project_types` | `ProjectTypesController` (all actions) | Allows user to manage `ProjectType` (creation/deletion/updating) |
| `project.announcements.manage` | `AnnouncementsController#create/destroy _pro_announce` | Allows user to manage `ProjectAnnouncement` (creation/deletion) |
| `announcements.manage` | `AnnouncementsController#create/destroy _sys_announce` | Allows user to manage `SystemAnnouncement` (creation/deletion) |

**All `projects.*` permissions (except `projects.create`) can be scoped to only a certain project through `ProjectRolePermissions`. If a system `Group` is given these permissions, users within that group have permission to perform associated actions on ANY project.**
### Actions requiring only a user account

WIP

### Actions requiring no authentication

WIP
