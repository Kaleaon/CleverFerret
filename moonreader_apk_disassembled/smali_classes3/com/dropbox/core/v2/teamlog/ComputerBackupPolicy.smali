.class public final enum Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;
.super Ljava/lang/Enum;
.source "ComputerBackupPolicy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;

.field public static final enum DEFAULT:Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;

.field public static final enum DISABLED:Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;

.field public static final enum ENABLED:Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;

.field public static final enum OTHER:Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 24
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;

    const-string v1, "DEFAULT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;->DEFAULT:Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;

    .line 25
    new-instance v1, Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;

    const-string v3, "DISABLED"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;->DISABLED:Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;

    .line 26
    new-instance v3, Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;

    const-string v5, "ENABLED"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;->ENABLED:Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;

    .line 34
    new-instance v5, Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;

    const-string v7, "OTHER"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;->OTHER:Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;

    const/4 v7, 0x4

    .line 22
    new-array v7, v7, [Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    sput-object v7, Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;->$VALUES:[Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;

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

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;
    .locals 1

    .line 22
    const-class v0, Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;
    .locals 1

    .line 22
    sget-object v0, Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;->$VALUES:[Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/teamlog/ComputerBackupPolicy;

    return-object v0
.end method
