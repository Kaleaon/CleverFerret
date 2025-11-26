.class Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository$2;
.super Ljava/lang/Object;
.source "FootnoteRepository.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ValueRunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;->getReferencedElements(Lcom/vladsch/flexmark/util/ast/Node;)Ljava/util/Set;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/ValueRunnable<",
        "Lcom/vladsch/flexmark/util/ast/Node;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;

.field final synthetic val$references:Ljava/util/HashSet;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;Ljava/util/HashSet;)V
    .locals 0

    .line 67
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository$2;->this$0:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;

    iput-object p2, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository$2;->val$references:Ljava/util/HashSet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 1

    .line 70
    instance-of v0, p1, Lcom/vladsch/flexmark/ext/footnotes/Footnote;

    if-eqz v0, :cond_0

    .line 71
    check-cast p1, Lcom/vladsch/flexmark/ext/footnotes/Footnote;

    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository$2;->this$0:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->getReferenceNode(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;)Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 73
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository$2;->val$references:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method public bridge synthetic run(Ljava/lang/Object;)V
    .locals 0

    .line 67
    check-cast p1, Lcom/vladsch/flexmark/util/ast/Node;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository$2;->run(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method
