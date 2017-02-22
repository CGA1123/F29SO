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
| `projects.view` | `ProjectsController#show` | Gives **global** permission to view any project |
| `<project_id>.projects.view` | `ProjectsController#show` | Gives **scoped** permission to view a specific project |
| `projects.edit` | `ProjectsController#update` & `ProjectsController#edit` | Gives **global** permission to edit any project |
| `<project_id>.projects.edit` | `ProjectsController#update` & `ProjectsController#edit` | Gives **scoped** permission to edit a specific project |
| `projects.delete` | `ProjectsController#destroy` | Gives **global** permission to delete any project |
| `<project_id>.projects.delete` | `ProjectsController#destroy` | Gives **scoped** permission to delete a specific project |
| `project.create` | `ProjectsController#create` | Gives permission to create a new project |
| `admin.groups.view` | `GroupsController#show, #index` & `GroupUsersController#index`  | Allows user to views groups (And group users) |
| `admin.groups.manage` | `GroupsController#create, #destroy` & `GroupUsersController#create, #search, #destroy` & `GroupPermissionsController#create` & `#destroy` | Allows a user to manage groups (creation/deletion), as well as group users (addition, removal), and group permissions (adding/removing) |
| `admin.groups.manage.users` | `GroupUsersController#create, #destroy #search` | Allows user to manage users within a group (addition, removal) |
| `admin.groups.manage.permissions` | `GroupPermissionsController#create` & `#destroy` | Allows user to manage permissions that a group has |
| `admin.project_types` | `ProjectTypesController` (all actions) | Allows user to manage `ProjectType` (creation/deletion/updating) |

### Actions requiring only a user account

WIP

### Actions requiring no authentication

WIP
