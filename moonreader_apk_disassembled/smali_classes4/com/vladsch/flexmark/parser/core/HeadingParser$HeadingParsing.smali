.class Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingParsing;
.super Lcom/vladsch/flexmark/ast/util/Parsing;
.source "HeadingParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/core/HeadingParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "HeadingParsing"
.end annotation


# instance fields
.field private final ATX_HEADING:Ljava/util/regex/Pattern;

.field private final ATX_TRAILING:Ljava/util/regex/Pattern;

.field private final SETEXT_HEADING:Ljava/util/regex/Pattern;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 2

    .line 28
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/util/Parsing;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    .line 30
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->HEADING_NO_ATX_SPACE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "^#{1,6}(?:[ \t]*|$)"

    :goto_0
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    goto :goto_1

    :cond_0
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->HEADING_NO_EMPTY_HEADING_WITHOUT_SPACE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "^#{1,6}[ \t]+"

    goto :goto_0

    :cond_1
    const-string v0, "^#{1,6}(?:[ \t]+|$)"

    goto :goto_0

    :goto_1
    iput-object v0, p0, Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingParsing;->ATX_HEADING:Ljava/util/regex/Pattern;

    .line 31
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->HEADING_NO_ATX_SPACE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "[ \t]*#+[ \t]*$"

    goto :goto_2

    :cond_2
    const-string v0, "(^| |\t)[ \t]*#+[ \t]*$"

    :goto_2
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingParsing;->ATX_TRAILING:Ljava/util/regex/Pattern;

    .line 33
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->HEADING_SETEXT_MARKER_LENGTH:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/4 v0, 0x1

    if-gt p1, v0, :cond_3

    .line 34
    const-string p1, "^(?:=+|-+)[ \t]*$"

    goto :goto_3

    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "^(?:={"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ",}|-{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ",})[ \t]*$"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_3
    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingParsing;->SETEXT_HEADING:Ljava/util/regex/Pattern;

    return-void
.end method

.method static synthetic access$000(Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingParsing;)Ljava/util/regex/Pattern;
    .locals 0

    .line 22
    iget-object p0, p0, Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingParsing;->ATX_HEADING:Ljava/util/regex/Pattern;

    return-object p0
.end method

.method static synthetic access$100(Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingParsing;)Ljava/util/regex/Pattern;
    .locals 0

    .line 22
    iget-object p0, p0, Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingParsing;->ATX_TRAILING:Ljava/util/regex/Pattern;

    return-object p0
.end method

.method static synthetic access$200(Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingParsing;)Ljava/util/regex/Pattern;
    .locals 0

    .line 22
    iget-object p0, p0, Lcom/vladsch/flexmark/parser/core/HeadingParser$HeadingParsing;->SETEXT_HEADING:Ljava/util/regex/Pattern;

    return-object p0
.end method
