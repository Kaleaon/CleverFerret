.class public Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteFormatOptions;
.super Ljava/lang/Object;
.source "FootnoteFormatOptions.java"


# instance fields
.field public final footnotePlacement:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

.field public final footnoteSort:Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    sget-object v0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension;->FOOTNOTE_PLACEMENT:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteFormatOptions;->footnotePlacement:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    .line 15
    sget-object v0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension;->FOOTNOTE_SORT:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteFormatOptions;->footnoteSort:Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;

    return-void
.end method
