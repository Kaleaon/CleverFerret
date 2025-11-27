.class public Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;
.super Ljava/lang/Object;
.source "HeaderIdGenerator.java"

# interfaces
.implements Lcom/vladsch/flexmark/html/renderer/HtmlIdGenerator;
.implements Lcom/vladsch/flexmark/html/Disposable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator$Factory;
    }
.end annotation


# instance fields
.field headerBaseIds:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field noDupedDashes:Z

.field nonAsciiToLowercase:Z

.field nonDashChars:Ljava/lang/String;

.field resolveDupes:Z

.field toDashChars:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;->headerBaseIds:Ljava/util/HashMap;

    return-void
.end method

.method public static generateId(Ljava/lang/CharSequence;Ljava/lang/String;Ljava/lang/String;ZZ)Ljava/lang/String;
    .locals 6

    .line 100
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    .line 101
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    const/4 v2, 0x0

    if-nez p1, :cond_0

    .line 102
    sget-object p1, Lcom/vladsch/flexmark/html/HtmlRenderer;->HEADER_ID_GENERATOR_TO_DASH_CHARS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {p1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    :cond_0
    if-nez p2, :cond_1

    .line 103
    sget-object p2, Lcom/vladsch/flexmark/html/HtmlRenderer;->HEADER_ID_GENERATOR_NON_DASH_CHARS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {p2, v2}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    :cond_1
    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_a

    .line 106
    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    .line 107
    invoke-static {v3}, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;->isAlphabetic(C)Z

    move-result v4

    if-eqz v4, :cond_4

    if-nez p4, :cond_3

    const/16 v4, 0x41

    if-lt v3, v4, :cond_2

    const/16 v4, 0x5a

    if-le v3, v4, :cond_3

    .line 109
    :cond_2
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 111
    :cond_3
    invoke-static {v3}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 113
    :cond_4
    invoke-static {v3}, Ljava/lang/Character;->isDigit(C)Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 114
    :cond_5
    invoke-virtual {p2, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_6

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 115
    :cond_6
    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    if-eq v4, v5, :cond_9

    const/16 v4, 0x2d

    if-eqz p3, :cond_8

    if-ne v3, v4, :cond_7

    .line 116
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-eqz v3, :cond_8

    .line 117
    :cond_7
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-eqz v3, :cond_9

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v3

    if-eq v3, v4, :cond_9

    .line 118
    :cond_8
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_9
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 120
    :cond_a
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static generateId(Ljava/lang/CharSequence;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 95
    invoke-static {p0, p1, v0, p2, v1}, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;->generateId(Ljava/lang/CharSequence;Ljava/lang/String;Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static generateId(Ljava/lang/CharSequence;Ljava/lang/String;ZZ)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 83
    invoke-static {p0, p1, v0, p2, p3}, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;->generateId(Ljava/lang/CharSequence;Ljava/lang/String;Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static isAlphabetic(C)Z
    .locals 1

    const/16 v0, 0x43e

    .line 129
    invoke-static {p0}, Ljava/lang/Character;->getType(I)I

    move-result p0

    shr-int p0, v0, p0

    const/4 v0, 0x1

    and-int/2addr p0, v0

    if-eqz p0, :cond_0

    return v0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public dispose()V
    .locals 1

    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;->headerBaseIds:Ljava/util/HashMap;

    return-void
.end method

.method generateId(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 51
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 52
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;->toDashChars:Ljava/lang/String;

    iget-object v1, p0, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;->nonDashChars:Ljava/lang/String;

    iget-boolean v2, p0, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;->noDupedDashes:Z

    iget-boolean v3, p0, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;->nonAsciiToLowercase:Z

    invoke-static {p1, v0, v1, v2, v3}, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;->generateId(Ljava/lang/CharSequence;Ljava/lang/String;Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object p1

    .line 54
    iget-boolean v0, p0, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;->resolveDupes:Z

    if-eqz v0, :cond_1

    .line 55
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;->headerBaseIds:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 56
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;->headerBaseIds:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    .line 59
    iget-object v1, p0, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;->headerBaseIds:Ljava/util/HashMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "-"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 62
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;->headerBaseIds:Ljava/util/HashMap;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    return-object p1

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method

.method public generateIds(Lcom/vladsch/flexmark/util/ast/Document;)V
    .locals 1

    .line 27
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->HEADER_ID_GENERATOR_RESOLVE_DUPES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;->resolveDupes:Z

    .line 28
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->HEADER_ID_GENERATOR_TO_DASH_CHARS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;->toDashChars:Ljava/lang/String;

    .line 29
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->HEADER_ID_GENERATOR_NON_DASH_CHARS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;->nonDashChars:Ljava/lang/String;

    .line 30
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->HEADER_ID_GENERATOR_NO_DUPED_DASHES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;->noDupedDashes:Z

    .line 31
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->HEADER_ID_GENERATOR_NON_ASCII_TO_LOWERCASE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;->nonAsciiToLowercase:Z

    .line 33
    new-instance v0, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator$1;

    invoke-direct {v0, p0}, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator$1;-><init>(Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;)V

    .line 47
    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator$1;->visit(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method public getId(Lcom/vladsch/flexmark/util/ast/Node;)Ljava/lang/String;
    .locals 1

    .line 73
    instance-of v0, p1, Lcom/vladsch/flexmark/ast/AnchorRefTarget;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/vladsch/flexmark/ast/AnchorRefTarget;

    invoke-interface {p1}, Lcom/vladsch/flexmark/ast/AnchorRefTarget;->getAnchorRefId()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getId(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 0

    .line 78
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/html/renderer/HeaderIdGenerator;->generateId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
