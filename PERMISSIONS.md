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
| `admin.groups` | `GroupsController` (all actions) | Allows user to manage groups |


### Actions requiring only a user account

WIP

### Actions requiring no authentication

WIP
