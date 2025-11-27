.class public final enum Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;
.super Ljava/lang/Enum;
.source "SharingAllowlistAddError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/SharingAllowlistAddError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Tag"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

.field public static final enum ENTRIES_ALREADY_EXIST:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

.field public static final enum MALFORMED_ENTRY:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

.field public static final enum NO_ENTRIES_PROVIDED:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

.field public static final enum OTHER:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

.field public static final enum TEAM_LIMIT_REACHED:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

.field public static final enum TOO_MANY_ENTRIES_PROVIDED:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

.field public static final enum UNKNOWN_ERROR:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 39
    new-instance v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    const-string v1, "MALFORMED_ENTRY"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;->MALFORMED_ENTRY:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    .line 43
    new-instance v1, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    const-string v3, "NO_ENTRIES_PROVIDED"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;->NO_ENTRIES_PROVIDED:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    .line 47
    new-instance v3, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    const-string v5, "TOO_MANY_ENTRIES_PROVIDED"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;->TOO_MANY_ENTRIES_PROVIDED:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    .line 51
    new-instance v5, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    const-string v7, "TEAM_LIMIT_REACHED"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;->TEAM_LIMIT_REACHED:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    .line 55
    new-instance v7, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    const-string v9, "UNKNOWN_ERROR"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;->UNKNOWN_ERROR:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    .line 59
    new-instance v9, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    const-string v11, "ENTRIES_ALREADY_EXIST"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;->ENTRIES_ALREADY_EXIST:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    .line 68
    new-instance v11, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    const-string v13, "OTHER"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;->OTHER:Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    const/4 v13, 0x7

    .line 35
    new-array v13, v13, [Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    aput-object v0, v13, v2

    aput-object v1, v13, v4

    aput-object v3, v13, v6

    aput-object v5, v13, v8

    aput-object v7, v13, v10

    aput-object v9, v13, v12

    aput-object v11, v13, v14

    sput-object v13, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;->$VALUES:[Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 35
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;
    .locals 1

    .line 35
    const-class v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;
    .locals 1

    .line 35
    sget-object v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;->$VALUES:[Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/team/SharingAllowlistAddError$Tag;

    return-object v0
.end method
