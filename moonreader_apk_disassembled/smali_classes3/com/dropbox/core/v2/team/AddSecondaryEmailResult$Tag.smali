.class public final enum Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;
.super Ljava/lang/Enum;
.source "AddSecondaryEmailResult.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/AddSecondaryEmailResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Tag"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

.field public static final enum ALREADY_OWNED_BY_USER:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

.field public static final enum ALREADY_PENDING:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

.field public static final enum OTHER:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

.field public static final enum RATE_LIMITED:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

.field public static final enum REACHED_LIMIT:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

.field public static final enum SUCCESS:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

.field public static final enum TOO_MANY_UPDATES:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

.field public static final enum TRANSIENT_ERROR:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

.field public static final enum UNAVAILABLE:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

.field public static final enum UNKNOWN_ERROR:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;


# direct methods
.method static constructor <clinit>()V
    .locals 21

    .line 46
    new-instance v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    const-string v1, "SUCCESS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->SUCCESS:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    .line 50
    new-instance v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    const-string v3, "UNAVAILABLE"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->UNAVAILABLE:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    .line 54
    new-instance v3, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    const-string v5, "ALREADY_PENDING"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->ALREADY_PENDING:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    .line 58
    new-instance v5, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    const-string v7, "ALREADY_OWNED_BY_USER"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->ALREADY_OWNED_BY_USER:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    .line 62
    new-instance v7, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    const-string v9, "REACHED_LIMIT"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->REACHED_LIMIT:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    .line 66
    new-instance v9, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    const-string v11, "TRANSIENT_ERROR"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->TRANSIENT_ERROR:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    .line 70
    new-instance v11, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    const-string v13, "TOO_MANY_UPDATES"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->TOO_MANY_UPDATES:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    .line 74
    new-instance v13, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    const-string v15, "UNKNOWN_ERROR"

    const/16 v16, 0x0

    const/4 v2, 0x7

    invoke-direct {v13, v15, v2}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v13, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->UNKNOWN_ERROR:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    .line 79
    new-instance v15, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    const/16 v17, 0x7

    const-string v2, "RATE_LIMITED"

    const/16 v18, 0x1

    const/16 v4, 0x8

    invoke-direct {v15, v2, v4}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v15, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->RATE_LIMITED:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    .line 88
    new-instance v2, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    const/16 v19, 0x8

    const-string v4, "OTHER"

    const/16 v20, 0x2

    const/16 v6, 0x9

    invoke-direct {v2, v4, v6}, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->OTHER:Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    const/16 v4, 0xa

    .line 42
    new-array v4, v4, [Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    aput-object v0, v4, v16

    aput-object v1, v4, v18

    aput-object v3, v4, v20

    aput-object v5, v4, v8

    aput-object v7, v4, v10

    aput-object v9, v4, v12

    aput-object v11, v4, v14

    aput-object v13, v4, v17

    aput-object v15, v4, v19

    aput-object v2, v4, v6

    sput-object v4, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->$VALUES:[Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 42
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;
    .locals 1

    .line 42
    const-class v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;
    .locals 1

    .line 42
    sget-object v0, Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->$VALUES:[Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/team/AddSecondaryEmailResult$Tag;

    return-object v0
.end method
