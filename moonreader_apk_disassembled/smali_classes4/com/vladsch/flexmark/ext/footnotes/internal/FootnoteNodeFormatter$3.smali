.class Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter$3;
.super Ljava/lang/Object;
.source "FootnoteNodeFormatter.java"

# interfaces
.implements Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter;->render(Lcom/vladsch/flexmark/ext/footnotes/Footnote;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter;

.field final synthetic val$referenceId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter;Ljava/lang/String;)V
    .locals 0

    .line 84
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter$3;->this$0:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter;

    iput-object p2, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter$3;->val$referenceId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public render(Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 87
    iget-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter$3;->val$referenceId:Ljava/lang/String;

    invoke-virtual {p2, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method
