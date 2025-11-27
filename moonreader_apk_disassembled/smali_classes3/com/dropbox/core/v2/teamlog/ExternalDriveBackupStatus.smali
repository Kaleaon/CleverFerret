.class public final enum Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;
.super Ljava/lang/Enum;
.source "ExternalDriveBackupStatus.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;

.field public static final enum BROKEN:Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;

.field public static final enum CREATED:Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;

.field public static final enum CREATED_OR_BROKEN:Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;

.field public static final enum DELETED:Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;

.field public static final enum EMPTY:Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;

.field public static final enum OTHER:Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;

.field public static final enum UNKNOWN:Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 24
    new-instance v0, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;

    const-string v1, "BROKEN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;->BROKEN:Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;

    .line 25
    new-instance v1, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;

    const-string v3, "CREATED"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;->CREATED:Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;

    .line 26
    new-instance v3, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;

    const-string v5, "CREATED_OR_BROKEN"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;->CREATED_OR_BROKEN:Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;

    .line 27
    new-instance v5, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;

    const-string v7, "DELETED"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;->DELETED:Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;

    .line 28
    new-instance v7, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;

    const-string v9, "EMPTY"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;->EMPTY:Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;

    .line 29
    new-instance v9, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;

    const-string v11, "UNKNOWN"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;->UNKNOWN:Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;

    .line 37
    new-instance v11, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;

    const-string v13, "OTHER"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;->OTHER:Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;

    const/4 v13, 0x7

    .line 22
    new-array v13, v13, [Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;

    aput-object v0, v13, v2

    aput-object v1, v13, v4

    aput-object v3, v13, v6

    aput-object v5, v13, v8

    aput-object v7, v13, v10

    aput-object v9, v13, v12

    aput-object v11, v13, v14

    sput-object v13, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;->$VALUES:[Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;

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

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;
    .locals 1

    .line 22
    const-class v0, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;
    .locals 1

    .line 22
    sget-object v0, Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;->$VALUES:[Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/teamlog/ExternalDriveBackupStatus;

    return-object v0
.end method
