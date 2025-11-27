.class public final enum Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;
.super Ljava/lang/Enum;
.source "ExtendedVersionHistoryPolicy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;

.field public static final enum EXPLICITLY_LIMITED:Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;

.field public static final enum EXPLICITLY_UNLIMITED:Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;

.field public static final enum IMPLICITLY_LIMITED:Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;

.field public static final enum IMPLICITLY_UNLIMITED:Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;

.field public static final enum OTHER:Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 21
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;

    const-string v1, "EXPLICITLY_LIMITED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;->EXPLICITLY_LIMITED:Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;

    .line 22
    new-instance v1, Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;

    const-string v3, "EXPLICITLY_UNLIMITED"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;->EXPLICITLY_UNLIMITED:Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;

    .line 23
    new-instance v3, Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;

    const-string v5, "IMPLICITLY_LIMITED"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;->IMPLICITLY_LIMITED:Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;

    .line 24
    new-instance v5, Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;

    const-string v7, "IMPLICITLY_UNLIMITED"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;->IMPLICITLY_UNLIMITED:Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;

    .line 32
    new-instance v7, Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;

    const-string v9, "OTHER"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;->OTHER:Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;

    const/4 v9, 0x5

    .line 19
    new-array v9, v9, [Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;

    aput-object v0, v9, v2

    aput-object v1, v9, v4

    aput-object v3, v9, v6

    aput-object v5, v9, v8

    aput-object v7, v9, v10

    sput-object v9, Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;->$VALUES:[Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;

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

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;
    .locals 1

    .line 19
    const-class v0, Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;
    .locals 1

    .line 19
    sget-object v0, Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;->$VALUES:[Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/teamlog/ExtendedVersionHistoryPolicy;

    return-object v0
.end method
