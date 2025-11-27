.class public final enum Lcom/dropbox/core/v2/teamlog/AccountState;
.super Ljava/lang/Enum;
.source "AccountState.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/AccountState$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/teamlog/AccountState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/teamlog/AccountState;

.field public static final enum LOCKED:Lcom/dropbox/core/v2/teamlog/AccountState;

.field public static final enum OTHER:Lcom/dropbox/core/v2/teamlog/AccountState;

.field public static final enum UNLOCKED:Lcom/dropbox/core/v2/teamlog/AccountState;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 21
    new-instance v0, Lcom/dropbox/core/v2/teamlog/AccountState;

    const-string v1, "LOCKED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/teamlog/AccountState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/AccountState;->LOCKED:Lcom/dropbox/core/v2/teamlog/AccountState;

    .line 22
    new-instance v1, Lcom/dropbox/core/v2/teamlog/AccountState;

    const-string v3, "UNLOCKED"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/teamlog/AccountState;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/teamlog/AccountState;->UNLOCKED:Lcom/dropbox/core/v2/teamlog/AccountState;

    .line 30
    new-instance v3, Lcom/dropbox/core/v2/teamlog/AccountState;

    const-string v5, "OTHER"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/teamlog/AccountState;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/teamlog/AccountState;->OTHER:Lcom/dropbox/core/v2/teamlog/AccountState;

    const/4 v5, 0x3

    .line 19
    new-array v5, v5, [Lcom/dropbox/core/v2/teamlog/AccountState;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    sput-object v5, Lcom/dropbox/core/v2/teamlog/AccountState;->$VALUES:[Lcom/dropbox/core/v2/teamlog/AccountState;

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

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/AccountState;
    .locals 1

    .line 19
    const-class v0, Lcom/dropbox/core/v2/teamlog/AccountState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/teamlog/AccountState;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/teamlog/AccountState;
    .locals 1

    .line 19
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AccountState;->$VALUES:[Lcom/dropbox/core/v2/teamlog/AccountState;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/teamlog/AccountState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/teamlog/AccountState;

    return-object v0
.end method
