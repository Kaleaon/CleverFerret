.class public final enum Lcom/vladsch/flexmark/html/renderer/RenderingPhase;
.super Ljava/lang/Enum;
.source "RenderingPhase.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/vladsch/flexmark/html/renderer/RenderingPhase;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

.field public static final enum BODY:Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

.field public static final enum BODY_BOTTOM:Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

.field public static final enum BODY_LOAD_SCRIPTS:Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

.field public static final enum BODY_SCRIPTS:Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

.field public static final enum BODY_TOP:Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

.field public static final enum HEAD:Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

.field public static final enum HEAD_BOTTOM:Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

.field public static final enum HEAD_CSS:Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

.field public static final enum HEAD_SCRIPTS:Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

.field public static final enum HEAD_TOP:Lcom/vladsch/flexmark/html/renderer/RenderingPhase;


# direct methods
.method static constructor <clinit>()V
    .locals 21

    .line 4
    new-instance v0, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    const-string v1, "HEAD_TOP"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;->HEAD_TOP:Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    .line 5
    new-instance v1, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    const-string v3, "HEAD"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;->HEAD:Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    .line 6
    new-instance v3, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    const-string v5, "HEAD_CSS"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;->HEAD_CSS:Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    .line 7
    new-instance v5, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    const-string v7, "HEAD_SCRIPTS"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;->HEAD_SCRIPTS:Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    .line 8
    new-instance v7, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    const-string v9, "HEAD_BOTTOM"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;->HEAD_BOTTOM:Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    .line 10
    new-instance v9, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    const-string v11, "BODY_TOP"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;->BODY_TOP:Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    .line 11
    new-instance v11, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    const-string v13, "BODY"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;->BODY:Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    .line 12
    new-instance v13, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    const-string v15, "BODY_BOTTOM"

    const/16 v16, 0x0

    const/4 v2, 0x7

    invoke-direct {v13, v15, v2}, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;-><init>(Ljava/lang/String;I)V

    sput-object v13, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;->BODY_BOTTOM:Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    .line 13
    new-instance v15, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    const/16 v17, 0x7

    const-string v2, "BODY_LOAD_SCRIPTS"

    const/16 v18, 0x1

    const/16 v4, 0x8

    invoke-direct {v15, v2, v4}, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;-><init>(Ljava/lang/String;I)V

    sput-object v15, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;->BODY_LOAD_SCRIPTS:Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    .line 14
    new-instance v2, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    const/16 v19, 0x8

    const-string v4, "BODY_SCRIPTS"

    const/16 v20, 0x2

    const/16 v6, 0x9

    invoke-direct {v2, v4, v6}, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;->BODY_SCRIPTS:Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    const/16 v4, 0xa

    .line 3
    new-array v4, v4, [Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

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

    sput-object v4, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;->$VALUES:[Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 3
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vladsch/flexmark/html/renderer/RenderingPhase;
    .locals 1

    .line 3
    const-class v0, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    return-object p0
.end method

.method public static values()[Lcom/vladsch/flexmark/html/renderer/RenderingPhase;
    .locals 1

    .line 3
    sget-object v0, Lcom/vladsch/flexmark/html/renderer/RenderingPhase;->$VALUES:[Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    invoke-virtual {v0}, [Lcom/vladsch/flexmark/html/renderer/RenderingPhase;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vladsch/flexmark/html/renderer/RenderingPhase;

    return-object v0
.end method
