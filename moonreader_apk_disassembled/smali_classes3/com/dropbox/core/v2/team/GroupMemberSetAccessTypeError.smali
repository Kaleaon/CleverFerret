.class public final enum Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;
.super Ljava/lang/Enum;
.source "GroupMemberSetAccessTypeError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;

.field public static final enum GROUP_NOT_FOUND:Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;

.field public static final enum MEMBER_NOT_IN_GROUP:Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;

.field public static final enum OTHER:Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;

.field public static final enum SYSTEM_MANAGED_GROUP_DISALLOWED:Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;

.field public static final enum USER_CANNOT_BE_MANAGER_OF_COMPANY_MANAGED_GROUP:Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 24
    new-instance v0, Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;

    const-string v1, "GROUP_NOT_FOUND"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;->GROUP_NOT_FOUND:Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;

    .line 32
    new-instance v1, Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;

    const-string v3, "OTHER"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;->OTHER:Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;

    .line 36
    new-instance v3, Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;

    const-string v5, "SYSTEM_MANAGED_GROUP_DISALLOWED"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;->SYSTEM_MANAGED_GROUP_DISALLOWED:Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;

    .line 40
    new-instance v5, Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;

    const-string v7, "MEMBER_NOT_IN_GROUP"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;->MEMBER_NOT_IN_GROUP:Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;

    .line 44
    new-instance v7, Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;

    const-string v9, "USER_CANNOT_BE_MANAGER_OF_COMPANY_MANAGED_GROUP"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;->USER_CANNOT_BE_MANAGER_OF_COMPANY_MANAGED_GROUP:Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;

    const/4 v9, 0x5

    .line 19
    new-array v9, v9, [Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;

    aput-object v0, v9, v2

    aput-object v1, v9, v4

    aput-object v3, v9, v6

    aput-object v5, v9, v8

    aput-object v7, v9, v10

    sput-object v9, Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;->$VALUES:[Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 19
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;
    .locals 1

    .line 19
    const-class v0, Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;
    .locals 1

    .line 19
    sget-object v0, Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;->$VALUES:[Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/team/GroupMemberSetAccessTypeError;

    return-object v0
.end method
