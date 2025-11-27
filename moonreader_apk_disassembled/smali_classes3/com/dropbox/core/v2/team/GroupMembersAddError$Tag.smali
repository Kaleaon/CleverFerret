.class public final enum Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;
.super Ljava/lang/Enum;
.source "GroupMembersAddError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/GroupMembersAddError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Tag"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

.field public static final enum DUPLICATE_USER:Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

.field public static final enum GROUP_NOT_FOUND:Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

.field public static final enum GROUP_NOT_IN_TEAM:Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

.field public static final enum MEMBERS_NOT_IN_TEAM:Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

.field public static final enum OTHER:Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

.field public static final enum SYSTEM_MANAGED_GROUP_DISALLOWED:Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

.field public static final enum USERS_NOT_FOUND:Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

.field public static final enum USER_CANNOT_BE_MANAGER_OF_COMPANY_MANAGED_GROUP:Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

.field public static final enum USER_MUST_BE_ACTIVE_TO_BE_OWNER:Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;


# direct methods
.method static constructor <clinit>()V
    .locals 19

    .line 36
    new-instance v0, Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

    const-string v1, "GROUP_NOT_FOUND"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;->GROUP_NOT_FOUND:Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

    .line 45
    new-instance v1, Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

    const-string v3, "OTHER"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;->OTHER:Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

    .line 49
    new-instance v3, Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

    const-string v5, "SYSTEM_MANAGED_GROUP_DISALLOWED"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;->SYSTEM_MANAGED_GROUP_DISALLOWED:Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

    .line 54
    new-instance v5, Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

    const-string v7, "DUPLICATE_USER"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;->DUPLICATE_USER:Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

    .line 59
    new-instance v7, Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

    const-string v9, "GROUP_NOT_IN_TEAM"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;->GROUP_NOT_IN_TEAM:Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

    .line 67
    new-instance v9, Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

    const-string v11, "MEMBERS_NOT_IN_TEAM"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;->MEMBERS_NOT_IN_TEAM:Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

    .line 71
    new-instance v11, Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

    const-string v13, "USERS_NOT_FOUND"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;->USERS_NOT_FOUND:Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

    .line 76
    new-instance v13, Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

    const-string v15, "USER_MUST_BE_ACTIVE_TO_BE_OWNER"

    const/16 v16, 0x0

    const/4 v2, 0x7

    invoke-direct {v13, v15, v2}, Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v13, Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;->USER_MUST_BE_ACTIVE_TO_BE_OWNER:Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

    .line 80
    new-instance v15, Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

    const/16 v17, 0x7

    const-string v2, "USER_CANNOT_BE_MANAGER_OF_COMPANY_MANAGED_GROUP"

    const/16 v18, 0x1

    const/16 v4, 0x8

    invoke-direct {v15, v2, v4}, Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v15, Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;->USER_CANNOT_BE_MANAGER_OF_COMPANY_MANAGED_GROUP:Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

    const/16 v2, 0x9

    .line 32
    new-array v2, v2, [Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

    aput-object v0, v2, v16

    aput-object v1, v2, v18

    aput-object v3, v2, v6

    aput-object v5, v2, v8

    aput-object v7, v2, v10

    aput-object v9, v2, v12

    aput-object v11, v2, v14

    aput-object v13, v2, v17

    aput-object v15, v2, v4

    sput-object v2, Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;->$VALUES:[Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 32
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;
    .locals 1

    .line 32
    const-class v0, Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;
    .locals 1

    .line 32
    sget-object v0, Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;->$VALUES:[Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/team/GroupMembersAddError$Tag;

    return-object v0
.end method
