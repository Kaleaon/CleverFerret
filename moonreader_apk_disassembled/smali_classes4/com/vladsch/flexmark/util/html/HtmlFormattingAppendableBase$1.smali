.class Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase$1;
.super Ljava/lang/Object;
.source "HtmlFormattingAppendableBase.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/html/ConditionalFormatter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->tag(Ljava/lang/CharSequence;ZZLjava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

.field final synthetic val$isIndentIndentingChildren:Z

.field final synthetic val$isLineOnChildText:Z


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;ZZ)V
    .locals 0

    .line 299
    iput-object p1, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase$1;->this$0:Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    iput-boolean p2, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase$1;->val$isIndentIndentingChildren:Z

    iput-boolean p3, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase$1;->val$isLineOnChildText:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(ZZZZ)V
    .locals 0

    if-eqz p2, :cond_1

    .line 303
    iget-boolean p1, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase$1;->val$isIndentIndentingChildren:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase$1;->this$0:Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    invoke-static {p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->access$000(Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->indent()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-void

    .line 304
    :cond_0
    iget-object p1, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase$1;->this$0:Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    invoke-static {p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->access$000(Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->line()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-void

    :cond_1
    if-eqz p1, :cond_3

    .line 306
    iget-boolean p1, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase$1;->val$isLineOnChildText:Z

    if-eqz p1, :cond_2

    .line 307
    iget-object p1, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase$1;->this$0:Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    invoke-static {p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->access$000(Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->line()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    return-void

    :cond_2
    if-eqz p3, :cond_3

    .line 310
    iget-object p1, p0, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase$1;->this$0:Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    invoke-static {p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->access$000(Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;)Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/html/FormattingAppendable;->line()Lcom/vladsch/flexmark/util/html/FormattingAppendable;

    :cond_3
    return-void
.end method
