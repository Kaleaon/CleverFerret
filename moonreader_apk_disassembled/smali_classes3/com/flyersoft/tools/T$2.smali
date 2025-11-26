.class Lcom/flyersoft/tools/T$2;
.super Lcom/flyersoft/tools/T$MyClickableSpan;
.source "T.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/tools/T;->makeLinkClickable(Landroid/text/SpannableStringBuilder;Landroid/text/style/URLSpan;Lcom/flyersoft/tools/T$OnUrlClick;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 3142
    invoke-direct {p0}, Lcom/flyersoft/tools/T$MyClickableSpan;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 3144
    iget-object p1, p0, Lcom/flyersoft/tools/T$2;->onUrlClick:Lcom/flyersoft/tools/T$OnUrlClick;

    iget-object v0, p0, Lcom/flyersoft/tools/T$2;->url:Ljava/lang/String;

    invoke-interface {p1, v0}, Lcom/flyersoft/tools/T$OnUrlClick;->onClick(Ljava/lang/String;)V

    return-void
.end method
