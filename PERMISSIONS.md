# System Permissions

### Permissions

This file contains a record of all permissions registered in the system.

| Permission String | Action | Description |
| ----------------- | ------ | ----------- |
| `users.invite` | `User::InvitationsController#new` | Allows user to access a user invitation form |
| `users.invite` | `User::InvitationsController#create` | Allows user to create a user invitation |
| `users.invite.<group_id>` | Allows a user to invite users into the group with `id` of `group_id` |

### Actions requiring only a user account

WIP

### Actions requiring no authentication

WIP
