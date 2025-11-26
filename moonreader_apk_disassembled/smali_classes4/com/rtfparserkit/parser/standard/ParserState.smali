.class Lcom/rtfparserkit/parser/standard/ParserState;
.super Ljava/lang/Object;
.source "ParserState.java"


# instance fields
.field public currentEncoding:Ljava/lang/String;

.field public currentFont:I

.field public currentFontEncoding:Ljava/lang/String;

.field public unicodeAlternateSkipCount:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const-string v0, "Cp1252"

    iput-object v0, p0, Lcom/rtfparserkit/parser/standard/ParserState;->currentEncoding:Ljava/lang/String;

    const/4 v0, 0x1

    .line 40
    iput v0, p0, Lcom/rtfparserkit/parser/standard/ParserState;->unicodeAlternateSkipCount:I

    return-void
.end method

.method public constructor <init>(Lcom/rtfparserkit/parser/standard/ParserState;)V
    .locals 1

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const-string v0, "Cp1252"

    iput-object v0, p0, Lcom/rtfparserkit/parser/standard/ParserState;->currentEncoding:Ljava/lang/String;

    const/4 v0, 0x1

    .line 40
    iput v0, p0, Lcom/rtfparserkit/parser/standard/ParserState;->unicodeAlternateSkipCount:I

    .line 31
    iget v0, p1, Lcom/rtfparserkit/parser/standard/ParserState;->currentFont:I

    iput v0, p0, Lcom/rtfparserkit/parser/standard/ParserState;->currentFont:I

    .line 32
    iget-object v0, p1, Lcom/rtfparserkit/parser/standard/ParserState;->currentEncoding:Ljava/lang/String;

    iput-object v0, p0, Lcom/rtfparserkit/parser/standard/ParserState;->currentEncoding:Ljava/lang/String;

    .line 33
    iget-object v0, p1, Lcom/rtfparserkit/parser/standard/ParserState;->currentFontEncoding:Ljava/lang/String;

    iput-object v0, p0, Lcom/rtfparserkit/parser/standard/ParserState;->currentFontEncoding:Ljava/lang/String;

    .line 34
    iget p1, p1, Lcom/rtfparserkit/parser/standard/ParserState;->unicodeAlternateSkipCount:I

    iput p1, p0, Lcom/rtfparserkit/parser/standard/ParserState;->unicodeAlternateSkipCount:I

    return-void
.end method
