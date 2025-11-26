.class Lcom/vladsch/flexmark/parser/core/ThematicBreakParser$ThematicBreakOptions;
.super Ljava/lang/Object;
.source "ThematicBreakParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/core/ThematicBreakParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ThematicBreakOptions"
.end annotation


# instance fields
.field final relaxedStart:Z


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->THEMATIC_BREAK_RELAXED_START:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/core/ThematicBreakParser$ThematicBreakOptions;->relaxedStart:Z

    return-void
.end method
