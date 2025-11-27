.class Lcom/rtfparserkit/parser/standard/CommandEvent;
.super Ljava/lang/Object;
.source "CommandEvent.java"

# interfaces
.implements Lcom/rtfparserkit/parser/standard/IParserEvent;


# instance fields
.field private final command:Lcom/rtfparserkit/rtf/Command;

.field private final hasParameter:Z

.field private final optional:Z

.field private final parameter:I


# direct methods
.method public constructor <init>(Lcom/rtfparserkit/rtf/Command;IZZ)V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/rtfparserkit/parser/standard/CommandEvent;->command:Lcom/rtfparserkit/rtf/Command;

    .line 33
    iput p2, p0, Lcom/rtfparserkit/parser/standard/CommandEvent;->parameter:I

    .line 34
    iput-boolean p3, p0, Lcom/rtfparserkit/parser/standard/CommandEvent;->hasParameter:Z

    .line 35
    iput-boolean p4, p0, Lcom/rtfparserkit/parser/standard/CommandEvent;->optional:Z

    return-void
.end method


# virtual methods
.method public fire(Lcom/rtfparserkit/parser/IRtfListener;)V
    .locals 4

    .line 53
    iget-object v0, p0, Lcom/rtfparserkit/parser/standard/CommandEvent;->command:Lcom/rtfparserkit/rtf/Command;

    iget v1, p0, Lcom/rtfparserkit/parser/standard/CommandEvent;->parameter:I

    iget-boolean v2, p0, Lcom/rtfparserkit/parser/standard/CommandEvent;->hasParameter:Z

    iget-boolean v3, p0, Lcom/rtfparserkit/parser/standard/CommandEvent;->optional:Z

    invoke-interface {p1, v0, v1, v2, v3}, Lcom/rtfparserkit/parser/IRtfListener;->processCommand(Lcom/rtfparserkit/rtf/Command;IZZ)V

    return-void
.end method

.method public getCommand()Lcom/rtfparserkit/rtf/Command;
    .locals 1

    .line 61
    iget-object v0, p0, Lcom/rtfparserkit/parser/standard/CommandEvent;->command:Lcom/rtfparserkit/rtf/Command;

    return-object v0
.end method

.method public getType()Lcom/rtfparserkit/parser/standard/ParserEventType;
    .locals 1

    .line 44
    sget-object v0, Lcom/rtfparserkit/parser/standard/ParserEventType;->COMMAND_EVENT:Lcom/rtfparserkit/parser/standard/ParserEventType;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 67
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "[CommandEvent command="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/rtfparserkit/parser/standard/CommandEvent;->command:Lcom/rtfparserkit/rtf/Command;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/rtfparserkit/parser/standard/CommandEvent;->hasParameter:Z

    const-string v2, ""

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, " parameter="

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, p0, Lcom/rtfparserkit/parser/standard/CommandEvent;->parameter:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v2

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/rtfparserkit/parser/standard/CommandEvent;->optional:Z

    if-eqz v1, :cond_1

    const-string v2, " optional"

    :cond_1
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
