.class Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingOptions;
.super Ljava/lang/Object;
.source "HeadingParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/core/HeadingParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "HeadingOptions"
.end annotation


# instance fields
.field final canInterruptItemParagraph:Z

.field final noAtxSpace:Z

.field final noEmptyHeadingWithoutSpace:Z

.field final noLeadSpace:Z

.field final setextMarkerLength:I


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 208
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 209
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->HEADING_NO_ATX_SPACE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingOptions;->noAtxSpace:Z

    .line 210
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->HEADING_NO_EMPTY_HEADING_WITHOUT_SPACE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingOptions;->noEmptyHeadingWithoutSpace:Z

    .line 211
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->HEADING_NO_LEAD_SPACE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingOptions;->noLeadSpace:Z

    .line 212
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->HEADING_CAN_INTERRUPT_ITEM_PARAGRAPH:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingOptions;->canInterruptItemParagraph:Z

    .line 213
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->HEADING_SETEXT_MARKER_LENGTH:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingOptions;->setextMarkerLength:I

    return-void
.end method
