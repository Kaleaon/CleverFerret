.class public final enum Lcom/dropbox/core/v2/sharing/ResolvedVisibility;
.super Ljava/lang/Enum;
.source "ResolvedVisibility.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/ResolvedVisibility$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/sharing/ResolvedVisibility;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

.field public static final enum NO_ONE:Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

.field public static final enum ONLY_YOU:Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

.field public static final enum OTHER:Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

.field public static final enum PASSWORD:Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

.field public static final enum PUBLIC:Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

.field public static final enum SHARED_FOLDER_ONLY:Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

.field public static final enum TEAM_AND_PASSWORD:Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

.field public static final enum TEAM_ONLY:Lcom/dropbox/core/v2/sharing/ResolvedVisibility;


# direct methods
.method static constructor <clinit>()V
    .locals 17

    .line 30
    new-instance v0, Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

    const-string v1, "PUBLIC"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/sharing/ResolvedVisibility;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/sharing/ResolvedVisibility;->PUBLIC:Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

    .line 34
    new-instance v1, Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

    const-string v3, "TEAM_ONLY"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/sharing/ResolvedVisibility;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/sharing/ResolvedVisibility;->TEAM_ONLY:Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

    .line 39
    new-instance v3, Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

    const-string v5, "PASSWORD"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/sharing/ResolvedVisibility;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/sharing/ResolvedVisibility;->PASSWORD:Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

    .line 44
    new-instance v5, Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

    const-string v7, "TEAM_AND_PASSWORD"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/sharing/ResolvedVisibility;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/sharing/ResolvedVisibility;->TEAM_AND_PASSWORD:Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

    .line 49
    new-instance v7, Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

    const-string v9, "SHARED_FOLDER_ONLY"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/dropbox/core/v2/sharing/ResolvedVisibility;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/dropbox/core/v2/sharing/ResolvedVisibility;->SHARED_FOLDER_ONLY:Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

    .line 56
    new-instance v9, Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

    const-string v11, "NO_ONE"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/dropbox/core/v2/sharing/ResolvedVisibility;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/dropbox/core/v2/sharing/ResolvedVisibility;->NO_ONE:Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

    .line 60
    new-instance v11, Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

    const-string v13, "ONLY_YOU"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/dropbox/core/v2/sharing/ResolvedVisibility;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/dropbox/core/v2/sharing/ResolvedVisibility;->ONLY_YOU:Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

    .line 68
    new-instance v13, Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

    const-string v15, "OTHER"

    const/16 v16, 0x0

    const/4 v2, 0x7

    invoke-direct {v13, v15, v2}, Lcom/dropbox/core/v2/sharing/ResolvedVisibility;-><init>(Ljava/lang/String;I)V

    sput-object v13, Lcom/dropbox/core/v2/sharing/ResolvedVisibility;->OTHER:Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

    const/16 v15, 0x8

    .line 25
    new-array v15, v15, [Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

    aput-object v0, v15, v16

    aput-object v1, v15, v4

    aput-object v3, v15, v6

    aput-object v5, v15, v8

    aput-object v7, v15, v10

    aput-object v9, v15, v12

    aput-object v11, v15, v14

    aput-object v13, v15, v2

    sput-object v15, Lcom/dropbox/core/v2/sharing/ResolvedVisibility;->$VALUES:[Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 25
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/ResolvedVisibility;
    .locals 1

    .line 25
    const-class v0, Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/sharing/ResolvedVisibility;
    .locals 1

    .line 25
    sget-object v0, Lcom/dropbox/core/v2/sharing/ResolvedVisibility;->$VALUES:[Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/sharing/ResolvedVisibility;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/sharing/ResolvedVisibility;

    return-object v0
.end method
