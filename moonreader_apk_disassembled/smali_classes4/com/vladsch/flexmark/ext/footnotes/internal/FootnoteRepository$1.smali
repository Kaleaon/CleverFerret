.class Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository$1;
.super Ljava/lang/Object;
.source "FootnoteRepository.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;->resolveFootnoteOrdinals()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;)V
    .locals 0

    .line 33
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository$1;->this$0:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;)I
    .locals 0

    .line 36
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->getFirstReferenceOffset()I

    move-result p1

    invoke-virtual {p2}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->getFirstReferenceOffset()I

    move-result p2

    sub-int/2addr p1, p2

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 33
    check-cast p1, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    check-cast p2, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository$1;->compare(Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;)I

    move-result p1

    return p1
.end method
