.class public final enum Lcom/dropbox/core/v2/teamlog/DispositionActionType;
.super Ljava/lang/Enum;
.source "DispositionActionType.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/DispositionActionType$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/teamlog/DispositionActionType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/teamlog/DispositionActionType;

.field public static final enum AUTOMATIC_DELETE:Lcom/dropbox/core/v2/teamlog/DispositionActionType;

.field public static final enum AUTOMATIC_PERMANENTLY_DELETE:Lcom/dropbox/core/v2/teamlog/DispositionActionType;

.field public static final enum OTHER:Lcom/dropbox/core/v2/teamlog/DispositionActionType;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 21
    new-instance v0, Lcom/dropbox/core/v2/teamlog/DispositionActionType;

    const-string v1, "AUTOMATIC_DELETE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/teamlog/DispositionActionType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/teamlog/DispositionActionType;->AUTOMATIC_DELETE:Lcom/dropbox/core/v2/teamlog/DispositionActionType;

    .line 22
    new-instance v1, Lcom/dropbox/core/v2/teamlog/DispositionActionType;

    const-string v3, "AUTOMATIC_PERMANENTLY_DELETE"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/teamlog/DispositionActionType;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/teamlog/DispositionActionType;->AUTOMATIC_PERMANENTLY_DELETE:Lcom/dropbox/core/v2/teamlog/DispositionActionType;

    .line 30
    new-instance v3, Lcom/dropbox/core/v2/teamlog/DispositionActionType;

    const-string v5, "OTHER"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/teamlog/DispositionActionType;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/teamlog/DispositionActionType;->OTHER:Lcom/dropbox/core/v2/teamlog/DispositionActionType;

    const/4 v5, 0x3

    .line 19
    new-array v5, v5, [Lcom/dropbox/core/v2/teamlog/DispositionActionType;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    sput-object v5, Lcom/dropbox/core/v2/teamlog/DispositionActionType;->$VALUES:[Lcom/dropbox/core/v2/teamlog/DispositionActionType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/DispositionActionType;
    .locals 1

    .line 19
    const-class v0, Lcom/dropbox/core/v2/teamlog/DispositionActionType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/teamlog/DispositionActionType;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/teamlog/DispositionActionType;
    .locals 1

    .line 19
    sget-object v0, Lcom/dropbox/core/v2/teamlog/DispositionActionType;->$VALUES:[Lcom/dropbox/core/v2/teamlog/DispositionActionType;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/teamlog/DispositionActionType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/teamlog/DispositionActionType;

    return-object v0
.end method
