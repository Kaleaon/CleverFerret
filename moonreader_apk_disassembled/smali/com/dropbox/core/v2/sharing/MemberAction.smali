.class public final enum Lcom/dropbox/core/v2/sharing/MemberAction;
.super Ljava/lang/Enum;
.source "MemberAction.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/MemberAction$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/sharing/MemberAction;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/sharing/MemberAction;

.field public static final enum LEAVE_A_COPY:Lcom/dropbox/core/v2/sharing/MemberAction;

.field public static final enum MAKE_EDITOR:Lcom/dropbox/core/v2/sharing/MemberAction;

.field public static final enum MAKE_OWNER:Lcom/dropbox/core/v2/sharing/MemberAction;

.field public static final enum MAKE_VIEWER:Lcom/dropbox/core/v2/sharing/MemberAction;

.field public static final enum MAKE_VIEWER_NO_COMMENT:Lcom/dropbox/core/v2/sharing/MemberAction;

.field public static final enum OTHER:Lcom/dropbox/core/v2/sharing/MemberAction;

.field public static final enum REMOVE:Lcom/dropbox/core/v2/sharing/MemberAction;


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 27
    new-instance v0, Lcom/dropbox/core/v2/sharing/MemberAction;

    const-string v1, "LEAVE_A_COPY"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/sharing/MemberAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/sharing/MemberAction;->LEAVE_A_COPY:Lcom/dropbox/core/v2/sharing/MemberAction;

    .line 31
    new-instance v1, Lcom/dropbox/core/v2/sharing/MemberAction;

    const-string v3, "MAKE_EDITOR"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/sharing/MemberAction;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/sharing/MemberAction;->MAKE_EDITOR:Lcom/dropbox/core/v2/sharing/MemberAction;

    .line 35
    new-instance v3, Lcom/dropbox/core/v2/sharing/MemberAction;

    const-string v5, "MAKE_OWNER"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/sharing/MemberAction;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/sharing/MemberAction;->MAKE_OWNER:Lcom/dropbox/core/v2/sharing/MemberAction;

    .line 39
    new-instance v5, Lcom/dropbox/core/v2/sharing/MemberAction;

    const-string v7, "MAKE_VIEWER"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/sharing/MemberAction;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/sharing/MemberAction;->MAKE_VIEWER:Lcom/dropbox/core/v2/sharing/MemberAction;

    .line 43
    new-instance v7, Lcom/dropbox/core/v2/sharing/MemberAction;

    const-string v9, "MAKE_VIEWER_NO_COMMENT"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/dropbox/core/v2/sharing/MemberAction;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/dropbox/core/v2/sharing/MemberAction;->MAKE_VIEWER_NO_COMMENT:Lcom/dropbox/core/v2/sharing/MemberAction;

    .line 47
    new-instance v9, Lcom/dropbox/core/v2/sharing/MemberAction;

    const-string v11, "REMOVE"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/dropbox/core/v2/sharing/MemberAction;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/dropbox/core/v2/sharing/MemberAction;->REMOVE:Lcom/dropbox/core/v2/sharing/MemberAction;

    .line 55
    new-instance v11, Lcom/dropbox/core/v2/sharing/MemberAction;

    const-string v13, "OTHER"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/dropbox/core/v2/sharing/MemberAction;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/dropbox/core/v2/sharing/MemberAction;->OTHER:Lcom/dropbox/core/v2/sharing/MemberAction;

    const/4 v13, 0x7

    .line 22
    new-array v13, v13, [Lcom/dropbox/core/v2/sharing/MemberAction;

    aput-object v0, v13, v2

    aput-object v1, v13, v4

    aput-object v3, v13, v6

    aput-object v5, v13, v8

    aput-object v7, v13, v10

    aput-object v9, v13, v12

    aput-object v11, v13, v14

    sput-object v13, Lcom/dropbox/core/v2/sharing/MemberAction;->$VALUES:[Lcom/dropbox/core/v2/sharing/MemberAction;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 22
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/MemberAction;
    .locals 1

    .line 22
    const-class v0, Lcom/dropbox/core/v2/sharing/MemberAction;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/sharing/MemberAction;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/sharing/MemberAction;
    .locals 1

    .line 22
    sget-object v0, Lcom/dropbox/core/v2/sharing/MemberAction;->$VALUES:[Lcom/dropbox/core/v2/sharing/MemberAction;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/sharing/MemberAction;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/sharing/MemberAction;

    return-object v0
.end method
