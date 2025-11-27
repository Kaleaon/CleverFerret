.class synthetic Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$13;
.super Ljava/lang/Object;
.source "TableNodeRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$vladsch$flexmark$ext$tables$TableCell$Alignment:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 142
    invoke-static {}, Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;->values()[Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$13;->$SwitchMap$com$vladsch$flexmark$ext$tables$TableCell$Alignment:[I

    :try_start_0
    sget-object v1, Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;->LEFT:Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$13;->$SwitchMap$com$vladsch$flexmark$ext$tables$TableCell$Alignment:[I

    sget-object v1, Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;->CENTER:Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :try_start_2
    sget-object v0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeRenderer$13;->$SwitchMap$com$vladsch$flexmark$ext$tables$TableCell$Alignment:[I

    sget-object v1, Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;->RIGHT:Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    return-void
.end method
