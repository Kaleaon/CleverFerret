.class public final enum Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;
.super Ljava/lang/Enum;
.source "AdminConsoleAppPolicy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

.field public static final enum ALLOW:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

.field public static final enum BLOCK:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

.field public static final enum DEFAULT:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

.field public static final enum OTHER:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 21
    new-instance v0, Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

    const-string v1, "ALLOW"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;->ALLOW:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

    .line 22
    new-instance v1, Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

    const-string v3, "BLOCK"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;->BLOCK:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

    .line 23
    new-instance v3, Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

    const-string v5, "DEFAULT"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;->DEFAULT:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

    .line 31
    new-instance v5, Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

    const-string v7, "OTHER"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;->OTHER:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

    const/4 v7, 0x4

    .line 19
    new-array v7, v7, [Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    sput-object v7, Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;->$VALUES:[Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

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

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;
    .locals 1

    .line 19
    const-class v0, Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;
    .locals 1

    .line 19
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;->$VALUES:[Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

    return-object v0
.end method
