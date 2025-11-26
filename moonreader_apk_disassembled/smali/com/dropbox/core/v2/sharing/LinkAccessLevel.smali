.class public final enum Lcom/dropbox/core/v2/sharing/LinkAccessLevel;
.super Ljava/lang/Enum;
.source "LinkAccessLevel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/LinkAccessLevel$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/sharing/LinkAccessLevel;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/sharing/LinkAccessLevel;

.field public static final enum EDITOR:Lcom/dropbox/core/v2/sharing/LinkAccessLevel;

.field public static final enum OTHER:Lcom/dropbox/core/v2/sharing/LinkAccessLevel;

.field public static final enum VIEWER:Lcom/dropbox/core/v2/sharing/LinkAccessLevel;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 24
    new-instance v0, Lcom/dropbox/core/v2/sharing/LinkAccessLevel;

    const-string v1, "VIEWER"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/sharing/LinkAccessLevel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/sharing/LinkAccessLevel;->VIEWER:Lcom/dropbox/core/v2/sharing/LinkAccessLevel;

    .line 28
    new-instance v1, Lcom/dropbox/core/v2/sharing/LinkAccessLevel;

    const-string v3, "EDITOR"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/sharing/LinkAccessLevel;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/sharing/LinkAccessLevel;->EDITOR:Lcom/dropbox/core/v2/sharing/LinkAccessLevel;

    .line 36
    new-instance v3, Lcom/dropbox/core/v2/sharing/LinkAccessLevel;

    const-string v5, "OTHER"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/sharing/LinkAccessLevel;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/sharing/LinkAccessLevel;->OTHER:Lcom/dropbox/core/v2/sharing/LinkAccessLevel;

    const/4 v5, 0x3

    .line 19
    new-array v5, v5, [Lcom/dropbox/core/v2/sharing/LinkAccessLevel;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    sput-object v5, Lcom/dropbox/core/v2/sharing/LinkAccessLevel;->$VALUES:[Lcom/dropbox/core/v2/sharing/LinkAccessLevel;

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

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/LinkAccessLevel;
    .locals 1

    .line 19
    const-class v0, Lcom/dropbox/core/v2/sharing/LinkAccessLevel;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/sharing/LinkAccessLevel;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/sharing/LinkAccessLevel;
    .locals 1

    .line 19
    sget-object v0, Lcom/dropbox/core/v2/sharing/LinkAccessLevel;->$VALUES:[Lcom/dropbox/core/v2/sharing/LinkAccessLevel;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/sharing/LinkAccessLevel;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/sharing/LinkAccessLevel;

    return-object v0
.end method
