.class public Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;
.super Ljava/lang/Object;
.source "InlineParserImpl.java"

# interfaces
.implements Lcom/vladsch/flexmark/parser/InlineParser;
.implements Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$ReferenceProcessorMatch;,
        Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$DelimiterData;,
        Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserExtensionDependencyHandler;,
        Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserExtensionDependencies;,
        Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserDependencyStage;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field protected block:Lcom/vladsch/flexmark/util/ast/Node;

.field protected currentText:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;"
        }
    .end annotation
.end field

.field protected customCharacters:Ljava/util/BitSet;

.field protected customSpecialCharacterFactoryMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Character;",
            "Lcom/vladsch/flexmark/parser/block/CharacterNodeFactory;",
            ">;"
        }
    .end annotation
.end field

.field protected customSpecialCharacterNodes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation
.end field

.field protected final delimiterCharacters:Ljava/util/BitSet;

.field protected final delimiterProcessors:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Character;",
            "Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;",
            ">;"
        }
    .end annotation
.end field

.field protected document:Lcom/vladsch/flexmark/util/ast/Document;

.field protected index:I

.field protected inlineParserExtensionFactories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/InlineParserExtensionFactory;",
            ">;"
        }
    .end annotation
.end field

.field protected inlineParserExtensions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Character;",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/InlineParserExtension;",
            ">;>;"
        }
    .end annotation
.end field

.field protected input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field private lastBracket:Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;

.field protected lastDelimiter:Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

.field protected linkRefProcessors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/LinkRefProcessor;",
            ">;"
        }
    .end annotation
.end field

.field protected final linkRefProcessorsData:Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;

.field protected myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

.field protected final options:Lcom/vladsch/flexmark/parser/InlineParserOptions;

.field protected final originalSpecialCharacters:Ljava/util/BitSet;

.field protected referenceRepository:Lcom/vladsch/flexmark/ast/util/ReferenceRepository;

.field protected specialCharacters:Ljava/util/BitSet;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/BitSet;Ljava/util/BitSet;Ljava/util/Map;Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/options/DataHolder;",
            "Ljava/util/BitSet;",
            "Ljava/util/BitSet;",
            "Ljava/util/Map<",
            "Ljava/lang/Character;",
            "Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;",
            ">;",
            "Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/InlineParserExtensionFactory;",
            ">;)V"
        }
    .end annotation

    .line 208
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 106
    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->linkRefProcessors:Ljava/util/List;

    .line 107
    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->inlineParserExtensions:Ljava/util/Map;

    .line 108
    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->inlineParserExtensionFactories:Ljava/util/List;

    .line 112
    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->customCharacters:Ljava/util/BitSet;

    .line 113
    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->customSpecialCharacterFactoryMap:Ljava/util/Map;

    .line 114
    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->customSpecialCharacterNodes:Ljava/util/ArrayList;

    .line 209
    new-instance v1, Lcom/vladsch/flexmark/ast/util/Parsing;

    invoke-direct {v1, p1}, Lcom/vladsch/flexmark/ast/util/Parsing;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    iput-object v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    .line 210
    new-instance v1, Lcom/vladsch/flexmark/parser/InlineParserOptions;

    invoke-direct {v1, p1}, Lcom/vladsch/flexmark/parser/InlineParserOptions;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    iput-object v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->options:Lcom/vladsch/flexmark/parser/InlineParserOptions;

    .line 211
    iput-object p4, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->delimiterProcessors:Ljava/util/Map;

    .line 212
    iput-object p5, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->linkRefProcessorsData:Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;

    .line 213
    iput-object p3, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->delimiterCharacters:Ljava/util/BitSet;

    .line 214
    iput-object p2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->originalSpecialCharacters:Ljava/util/BitSet;

    .line 215
    iput-object p2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->specialCharacters:Ljava/util/BitSet;

    .line 216
    invoke-interface {p6}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    move-object p6, v0

    :goto_0
    iput-object p6, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->inlineParserExtensionFactories:Ljava/util/List;

    return-void
.end method

.method private addBracket(Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;)V
    .locals 2

    .line 1123
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->lastBracket:Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    .line 1124
    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->setBracketAfter(Z)V

    .line 1126
    :cond_0
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->lastBracket:Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;

    return-void
.end method

.method private static addDelimiterProcessorForChar(CLcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(C",
            "Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;",
            "Ljava/util/Map<",
            "Ljava/lang/Character;",
            "Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;",
            ">;)V"
        }
    .end annotation

    .line 321
    invoke-static {p0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    invoke-interface {p2, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;

    if-nez p1, :cond_0

    return-void

    .line 323
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Delimiter processor conflict with delimiter char \'"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string p0, "\'"

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private static addDelimiterProcessors(Ljava/util/List;Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/Character;",
            "Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;",
            ">;)V"
        }
    .end annotation

    .line 310
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;

    .line 311
    invoke-interface {v0}, Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;->getOpeningCharacter()C

    move-result v1

    .line 312
    invoke-static {v1, v0, p1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->addDelimiterProcessorForChar(CLcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;Ljava/util/Map;)V

    .line 313
    invoke-interface {v0}, Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;->getClosingCharacter()C

    move-result v2

    if-eq v1, v2, :cond_0

    .line 315
    invoke-static {v2, v0, p1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->addDelimiterProcessorForChar(CLcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;Ljava/util/Map;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public static calculateDelimiterCharacters(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/Set;)Ljava/util/BitSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/options/DataHolder;",
            "Ljava/util/Set<",
            "Ljava/lang/Character;",
            ">;)",
            "Ljava/util/BitSet;"
        }
    .end annotation

    .line 220
    new-instance p0, Ljava/util/BitSet;

    invoke-direct {p0}, Ljava/util/BitSet;-><init>()V

    .line 221
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Character;

    .line 222
    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v0

    invoke-virtual {p0, v0}, Ljava/util/BitSet;->set(I)V

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public static calculateDelimiterProcessors(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/List;)Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/options/DataHolder;",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/Character;",
            "Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;",
            ">;"
        }
    .end annotation

    .line 243
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 245
    sget-object v1, Lcom/vladsch/flexmark/parser/Parser;->ASTERISK_DELIMITER_PROCESSOR:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p0, v1}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 246
    new-instance v1, Lcom/vladsch/flexmark/parser/core/delimiter/AsteriskDelimiterProcessor;

    sget-object v2, Lcom/vladsch/flexmark/parser/Parser;->STRONG_WRAPS_EMPHASIS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v2, p0}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-direct {v1, v2}, Lcom/vladsch/flexmark/parser/core/delimiter/AsteriskDelimiterProcessor;-><init>(Z)V

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->addDelimiterProcessors(Ljava/util/List;Ljava/util/Map;)V

    .line 248
    :cond_0
    sget-object v1, Lcom/vladsch/flexmark/parser/Parser;->UNDERSCORE_DELIMITER_PROCESSOR:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p0, v1}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 249
    new-instance v1, Lcom/vladsch/flexmark/parser/core/delimiter/UnderscoreDelimiterProcessor;

    sget-object v2, Lcom/vladsch/flexmark/parser/Parser;->STRONG_WRAPS_EMPHASIS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v2, p0}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    invoke-direct {v1, p0}, Lcom/vladsch/flexmark/parser/core/delimiter/UnderscoreDelimiterProcessor;-><init>(Z)V

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-static {p0, v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->addDelimiterProcessors(Ljava/util/List;Ljava/util/Map;)V

    .line 252
    :cond_1
    invoke-static {p1, v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->addDelimiterProcessors(Ljava/util/List;Ljava/util/Map;)V

    return-object v0
.end method

.method static calculateInlineParserExtensions(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/List;)Ljava/util/Map;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/options/DataHolder;",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/InlineParserExtensionFactory;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/Character;",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/InlineParserExtensionFactory;",
            ">;>;"
        }
    .end annotation

    .line 66
    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 68
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/parser/InlineParserExtensionFactory;

    .line 69
    invoke-interface {v0}, Lcom/vladsch/flexmark/parser/InlineParserExtensionFactory;->getCharacters()Ljava/lang/CharSequence;

    move-result-object v1

    const/4 v2, 0x0

    .line 70
    :goto_0
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 71
    invoke-interface {v1, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    .line 72
    invoke-static {v3}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v4

    invoke-interface {p0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    if-nez v4, :cond_1

    .line 74
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 75
    invoke-static {v3}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v3

    invoke-interface {p0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    :cond_1
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 82
    :cond_2
    new-instance p1, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserExtensionDependencyHandler;

    invoke-direct {p1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserExtensionDependencyHandler;-><init>()V

    .line 83
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 84
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Character;

    .line 85
    invoke-interface {p0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 88
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x1

    if-le v4, v5, :cond_4

    .line 89
    invoke-virtual {p1, v3}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserExtensionDependencyHandler;->resolveDependencies(Ljava/util/List;)Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;

    move-result-object v4

    check-cast v4, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserExtensionDependencies;

    .line 90
    new-instance v5, Ljava/util/ArrayList;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v5, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 91
    invoke-virtual {v4}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserExtensionDependencies;->getDependentStages()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserDependencyStage;

    .line 92
    iget-object v4, v4, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$InlineParserDependencyStage;->dependents:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_2

    :cond_3
    move-object v3, v5

    .line 96
    :cond_4
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_5
    return-object v0
.end method

.method public static calculateLinkRefProcessors(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/List;)Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/options/DataHolder;",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/LinkRefProcessorFactory;",
            ">;)",
            "Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;"
        }
    .end annotation

    .line 258
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-le v0, v1, :cond_2

    .line 259
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 260
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 262
    filled-new-array {v2}, [I

    move-result-object p1

    .line 264
    new-instance v1, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$1;

    invoke-direct {v1, p0, p1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$1;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;[I)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 283
    aget p1, p1, v2

    add-int/lit8 v1, p1, 0x1

    .line 286
    new-array v1, v1, [I

    .line 290
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const/4 v4, -0x1

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vladsch/flexmark/parser/LinkRefProcessorFactory;

    .line 291
    invoke-interface {v5, p0}, Lcom/vladsch/flexmark/parser/LinkRefProcessorFactory;->getBracketNestingLevel(Lcom/vladsch/flexmark/util/options/DataHolder;)I

    move-result v6

    if-ge v4, v6, :cond_0

    .line 292
    invoke-interface {v5, p0}, Lcom/vladsch/flexmark/parser/LinkRefProcessorFactory;->getBracketNestingLevel(Lcom/vladsch/flexmark/util/options/DataHolder;)I

    move-result v4

    .line 293
    aput v2, v1, v4

    if-ne v4, p1, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 299
    :cond_1
    :goto_1
    new-instance p0, Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;

    invoke-direct {p0, v0, p1, v1}, Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;-><init>(Ljava/util/List;I[I)V

    return-object p0

    .line 300
    :cond_2
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_3

    .line 301
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/parser/LinkRefProcessorFactory;

    invoke-interface {v0, p0}, Lcom/vladsch/flexmark/parser/LinkRefProcessorFactory;->getBracketNestingLevel(Lcom/vladsch/flexmark/util/options/DataHolder;)I

    move-result p0

    add-int/lit8 v0, p0, 0x1

    .line 302
    new-array v0, v0, [I

    .line 303
    new-instance v1, Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;

    invoke-direct {v1, p1, p0, v0}, Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;-><init>(Ljava/util/List;I[I)V

    return-object v1

    .line 305
    :cond_3
    new-instance p0, Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;

    new-array v0, v2, [I

    invoke-direct {p0, p1, v2, v0}, Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;-><init>(Ljava/util/List;I[I)V

    return-object p0
.end method

.method public static calculateSpecialCharacters(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/BitSet;)Ljava/util/BitSet;
    .locals 0

    .line 228
    new-instance p0, Ljava/util/BitSet;

    invoke-direct {p0}, Ljava/util/BitSet;-><init>()V

    .line 229
    invoke-virtual {p0, p1}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    const/16 p1, 0xd

    .line 230
    invoke-virtual {p0, p1}, Ljava/util/BitSet;->set(I)V

    const/16 p1, 0xa

    .line 231
    invoke-virtual {p0, p1}, Ljava/util/BitSet;->set(I)V

    const/16 p1, 0x60

    .line 232
    invoke-virtual {p0, p1}, Ljava/util/BitSet;->set(I)V

    const/16 p1, 0x5b

    .line 233
    invoke-virtual {p0, p1}, Ljava/util/BitSet;->set(I)V

    const/16 p1, 0x5d

    .line 234
    invoke-virtual {p0, p1}, Ljava/util/BitSet;->set(I)V

    const/16 p1, 0x5c

    .line 235
    invoke-virtual {p0, p1}, Ljava/util/BitSet;->set(I)V

    const/16 p1, 0x21

    .line 236
    invoke-virtual {p0, p1}, Ljava/util/BitSet;->set(I)V

    const/16 p1, 0x3c

    .line 237
    invoke-virtual {p0, p1}, Ljava/util/BitSet;->set(I)V

    const/16 p1, 0x26

    .line 238
    invoke-virtual {p0, p1}, Ljava/util/BitSet;->set(I)V

    return-object p0
.end method

.method protected static collapseLinkRefChildren(Lcom/vladsch/flexmark/util/ast/Node;Ljava/lang/Boolean;Z)V
    .locals 6

    .line 1546
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-eqz v0, :cond_3

    .line 1549
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v3

    .line 1550
    instance-of v4, v0, Lcom/vladsch/flexmark/ast/LinkRefDerived;

    if-eqz v4, :cond_2

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    move-object v5, v0

    check-cast v5, Lcom/vladsch/flexmark/ast/RefNode;

    invoke-virtual {v5}, Lcom/vladsch/flexmark/ast/RefNode;->isTentative()Z

    move-result v5

    if-ne v4, v5, :cond_2

    .line 1552
    :cond_0
    invoke-static {v0, p1, v1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->collapseLinkRefChildren(Lcom/vladsch/flexmark/util/ast/Node;Ljava/lang/Boolean;Z)V

    .line 1553
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    .line 1555
    new-instance v2, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 1556
    invoke-virtual {v2, v0}, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->addChildrenOf(Lcom/vladsch/flexmark/util/ast/Node;)V

    if-eqz v3, :cond_1

    .line 1558
    invoke-virtual {v2, v3}, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->insertMergedBefore(Lcom/vladsch/flexmark/util/ast/Node;)V

    goto :goto_1

    .line 1560
    :cond_1
    invoke-virtual {v2, p0}, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->appendMergedTo(Lcom/vladsch/flexmark/util/ast/Node;)V

    :goto_1
    const/4 v2, 0x1

    :cond_2
    move-object v0, v3

    goto :goto_0

    :cond_3
    if-eqz v2, :cond_4

    .line 1568
    invoke-static {p0}, Lcom/vladsch/flexmark/ast/util/TextNodeConverter;->mergeTextNodes(Lcom/vladsch/flexmark/util/ast/Node;)V

    :cond_4
    if-eqz p2, :cond_7

    .line 1573
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    .line 1574
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getLastChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p0

    if-ne p1, p0, :cond_5

    if-eqz p1, :cond_7

    .line 1577
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p0

    invoke-interface {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/vladsch/flexmark/util/ast/Node;->setChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    return-void

    :cond_5
    if-eqz p1, :cond_6

    .line 1579
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trimStart()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/util/ast/Node;->setChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    :cond_6
    if-eqz p0, :cond_7

    .line 1580
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trimEnd()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/ast/Node;->setChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    :cond_7
    return-void
.end method

.method protected static containsLinkRefs(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/ast/Node;Ljava/lang/Boolean;)Z
    .locals 3

    .line 1534
    invoke-interface {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v0

    .line 1535
    invoke-interface {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result p0

    :goto_0
    if-eqz p1, :cond_2

    .line 1537
    instance-of v1, p1, Lcom/vladsch/flexmark/ast/LinkRef;

    if-eqz v1, :cond_1

    if-eqz p2, :cond_0

    move-object v1, p1

    check-cast v1, Lcom/vladsch/flexmark/ast/LinkRef;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/ast/LinkRef;->isDefined()Z

    move-result v1

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-ne v1, v2, :cond_1

    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v1

    if-ge v1, p0, :cond_1

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v1

    if-le v1, v0, :cond_1

    const/4 p0, 0x1

    return p0

    .line 1540
    :cond_1
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    goto :goto_0

    :cond_2
    const/4 p0, 0x0

    return p0
.end method

.method private matchLinkRef(Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;III)Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$ReferenceProcessorMatch;
    .locals 9

    .line 1146
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->linkRefProcessorsData:Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;

    iget-object v0, v0, Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;->nestingIndex:[I

    array-length v0, v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 1153
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->linkRefProcessorsData:Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;

    iget-object v0, v0, Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;->processors:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 1154
    iget-object v2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->linkRefProcessorsData:Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;

    iget-object v2, v2, Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;->nestingIndex:[I

    add-int/2addr p4, p3

    aget v2, v2, p4

    move-object v3, v1

    move-object v4, v3

    :goto_0
    if-ge v2, v0, :cond_7

    .line 1156
    iget-object v5, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->linkRefProcessors:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vladsch/flexmark/parser/LinkRefProcessor;

    .line 1159
    invoke-interface {v5}, Lcom/vladsch/flexmark/parser/LinkRefProcessor;->getBracketNestingLevel()I

    move-result v6

    if-ge p4, v6, :cond_1

    goto/16 :goto_3

    .line 1161
    :cond_1
    invoke-interface {v5}, Lcom/vladsch/flexmark/parser/LinkRefProcessor;->getWantExclamationPrefix()Z

    move-result v6

    .line 1164
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->isImage()Z

    move-result v7

    if-eqz v7, :cond_3

    if-eqz v6, :cond_3

    if-nez v3, :cond_2

    .line 1166
    iget-object v3, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->getStartIndex()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    sub-int/2addr v7, p3

    add-int v8, p2, p3

    invoke-interface {v3, v7, v8}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    :cond_2
    :goto_1
    move-object v7, v4

    move-object v4, v3

    goto :goto_2

    :cond_3
    if-eqz v6, :cond_4

    .line 1169
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->getStartIndex()I

    move-result v7

    add-int/lit8 v8, p3, 0x1

    if-lt v7, v8, :cond_4

    iget-object v7, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->getStartIndex()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    sub-int/2addr v8, p3

    invoke-interface {v7, v8}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v7

    const/16 v8, 0x21

    if-ne v7, v8, :cond_4

    if-nez v3, :cond_2

    .line 1170
    iget-object v3, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->getStartIndex()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    sub-int/2addr v7, p3

    add-int v8, p2, p3

    invoke-interface {v3, v7, v8}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    goto :goto_1

    :cond_4
    if-nez v4, :cond_5

    .line 1173
    iget-object v4, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->getStartIndex()I

    move-result v7

    sub-int/2addr v7, p3

    add-int v8, p2, p3

    invoke-interface {v4, v7, v8}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v4

    :cond_5
    move-object v7, v4

    move-object v4, v3

    move-object v3, v7

    .line 1178
    :goto_2
    invoke-interface {v5, v3}, Lcom/vladsch/flexmark/parser/LinkRefProcessor;->isMatch(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 1179
    new-instance p1, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$ReferenceProcessorMatch;

    invoke-direct {p1, v5, v6, v3}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$ReferenceProcessorMatch;-><init>(Lcom/vladsch/flexmark/parser/LinkRefProcessor;ZLcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    return-object p1

    :cond_6
    add-int/lit8 v2, v2, 0x1

    move-object v3, v4

    move-object v4, v7

    goto/16 :goto_0

    :cond_7
    :goto_3
    return-object v1
.end method

.method private processCustomCharacters()Z
    .locals 7

    .line 723
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->peek()C

    move-result v0

    .line 724
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->customSpecialCharacterFactoryMap:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/parser/block/CharacterNodeFactory;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 727
    :cond_0
    invoke-interface {v0}, Lcom/vladsch/flexmark/parser/block/CharacterNodeFactory;->create()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/util/ast/Node;

    .line 728
    iget-object v3, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v4, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/lit8 v5, v4, 0x1

    invoke-interface {v3, v4, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vladsch/flexmark/util/ast/Node;->setChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 730
    iget-object v3, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->currentText:Ljava/util/ArrayList;

    if-eqz v3, :cond_3

    .line 731
    invoke-static {v3}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->of(Ljava/util/List;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    const/4 v4, 0x0

    .line 732
    iput-object v4, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->currentText:Ljava/util/ArrayList;

    .line 735
    invoke-interface {v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v5

    :goto_0
    if-lez v5, :cond_1

    add-int/lit8 v6, v5, -0x1

    .line 737
    invoke-interface {v3, v6}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v6

    invoke-interface {v0, v6}, Lcom/vladsch/flexmark/parser/block/CharacterNodeFactory;->skipPrev(C)Z

    move-result v6

    if-eqz v6, :cond_1

    add-int/lit8 v5, v5, -0x1

    goto :goto_0

    .line 738
    :cond_1
    invoke-interface {v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v6

    if-ge v5, v6, :cond_2

    .line 739
    invoke-interface {v3, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v4

    .line 740
    invoke-interface {v3, v1, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    .line 743
    :cond_2
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->block:Lcom/vladsch/flexmark/util/ast/Node;

    new-instance v5, Lcom/vladsch/flexmark/ast/Text;

    invoke-direct {v5, v3}, Lcom/vladsch/flexmark/ast/Text;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    invoke-virtual {v1, v5}, Lcom/vladsch/flexmark/util/ast/Node;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    if-eqz v4, :cond_3

    .line 744
    invoke-interface {v0}, Lcom/vladsch/flexmark/parser/block/CharacterNodeFactory;->wantSkippedWhitespace()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 745
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->block:Lcom/vladsch/flexmark/util/ast/Node;

    new-instance v3, Lcom/vladsch/flexmark/ast/WhiteSpace;

    invoke-direct {v3, v4}, Lcom/vladsch/flexmark/ast/WhiteSpace;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    invoke-virtual {v1, v3}, Lcom/vladsch/flexmark/util/ast/Node;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 749
    :cond_3
    invoke-virtual {p0, v2}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->appendNode(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 750
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->customSpecialCharacterNodes:Ljava/util/ArrayList;

    if-nez v1, :cond_4

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->customSpecialCharacterNodes:Ljava/util/ArrayList;

    .line 751
    :cond_4
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->customSpecialCharacterNodes:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 753
    iget v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    const/4 v2, 0x1

    add-int/2addr v1, v2

    .line 755
    :cond_5
    iget v3, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/2addr v3, v2

    iput v3, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    .line 756
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->peek()C

    move-result v3

    if-eqz v3, :cond_6

    .line 758
    invoke-interface {v0, v3}, Lcom/vladsch/flexmark/parser/block/CharacterNodeFactory;->skipNext(C)Z

    move-result v3

    if-nez v3, :cond_5

    .line 760
    :cond_6
    iget v3, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    if-ge v1, v3, :cond_7

    invoke-interface {v0}, Lcom/vladsch/flexmark/parser/block/CharacterNodeFactory;->wantSkippedWhitespace()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 761
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->block:Lcom/vladsch/flexmark/util/ast/Node;

    new-instance v3, Lcom/vladsch/flexmark/ast/WhiteSpace;

    iget-object v4, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v5, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    invoke-interface {v4, v1, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-direct {v3, v1}, Lcom/vladsch/flexmark/ast/WhiteSpace;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    invoke-virtual {v0, v3}, Lcom/vladsch/flexmark/util/ast/Node;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    :cond_7
    return v2
.end method

.method private removeLastBracket()V
    .locals 1

    .line 1130
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->lastBracket:Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->getPrevious()Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;

    move-result-object v0

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->lastBracket:Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;

    return-void
.end method


# virtual methods
.method public appendNode(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 1

    .line 602
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->flushTextNode()Z

    .line 603
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->block:Lcom/vladsch/flexmark/util/ast/Node;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/ast/Node;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method public appendSeparateText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/ast/Text;
    .locals 1

    .line 609
    new-instance v0, Lcom/vladsch/flexmark/ast/Text;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/ast/Text;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 610
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->appendNode(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-object v0
.end method

.method public appendText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V
    .locals 1

    .line 592
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->getCurrentText()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public appendText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;II)V
    .locals 1

    .line 597
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->getCurrentText()Ljava/util/ArrayList;

    move-result-object v0

    invoke-interface {p1, p2, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method protected clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1750
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public finalizeDocument(Lcom/vladsch/flexmark/util/ast/Document;)V
    .locals 2

    .line 182
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->inlineParserExtensions:Ljava/util/Map;

    if-eqz p1, :cond_1

    .line 183
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 184
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/parser/InlineParserExtension;

    .line 185
    invoke-interface {v1, p0}, Lcom/vladsch/flexmark/parser/InlineParserExtension;->finalizeDocument(Lcom/vladsch/flexmark/parser/InlineParser;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public flushTextNode()Z
    .locals 3

    .line 616
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->currentText:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 617
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->block:Lcom/vladsch/flexmark/util/ast/Node;

    new-instance v1, Lcom/vladsch/flexmark/ast/Text;

    iget-object v2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->currentText:Ljava/util/ArrayList;

    invoke-static {v2}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->of(Ljava/util/List;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/vladsch/flexmark/ast/Text;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/ast/Node;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    const/4 v0, 0x0

    .line 618
    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->currentText:Ljava/util/ArrayList;

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getBlock()Lcom/vladsch/flexmark/util/ast/Node;
    .locals 1

    .line 369
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->block:Lcom/vladsch/flexmark/util/ast/Node;

    return-object v0
.end method

.method public getCurrentText()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;"
        }
    .end annotation

    .line 192
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->currentText:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 193
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->currentText:Ljava/util/ArrayList;

    .line 196
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->currentText:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getDocument()Lcom/vladsch/flexmark/util/ast/Document;
    .locals 1

    .line 354
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->document:Lcom/vladsch/flexmark/util/ast/Document;

    return-object v0
.end method

.method public getIndex()I
    .locals 1

    .line 334
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    return v0
.end method

.method public getInput()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 329
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-object v0
.end method

.method public getLastBracket()Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;
    .locals 1

    .line 349
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->lastBracket:Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;

    return-object v0
.end method

.method public getLastDelimiter()Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;
    .locals 1

    .line 344
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->lastDelimiter:Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    return-object v0
.end method

.method public getOptions()Lcom/vladsch/flexmark/parser/InlineParserOptions;
    .locals 1

    .line 359
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->options:Lcom/vladsch/flexmark/parser/InlineParserOptions;

    return-object v0
.end method

.method public getParsing()Lcom/vladsch/flexmark/ast/util/Parsing;
    .locals 1

    .line 364
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    return-object v0
.end method

.method public initializeDocument(Lcom/vladsch/flexmark/ast/util/Parsing;Lcom/vladsch/flexmark/util/ast/Document;)V
    .locals 5

    .line 145
    iput-object p2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->document:Lcom/vladsch/flexmark/util/ast/Document;

    .line 146
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->REFERENCES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {p2, v0}, Lcom/vladsch/flexmark/util/ast/Document;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/ast/util/ReferenceRepository;

    iput-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->referenceRepository:Lcom/vladsch/flexmark/ast/util/ReferenceRepository;

    .line 147
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    .line 149
    new-instance p1, Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->linkRefProcessorsData:Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;

    iget-object v0, v0, Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;->processors:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->linkRefProcessors:Ljava/util/List;

    .line 150
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->linkRefProcessorsData:Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;

    iget-object p1, p1, Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;->processors:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/parser/LinkRefProcessorFactory;

    .line 151
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->linkRefProcessors:Ljava/util/List;

    invoke-interface {v0, p2}, Lcom/vladsch/flexmark/parser/LinkRefProcessorFactory;->create(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/parser/LinkRefProcessor;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 155
    :cond_0
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->inlineParserExtensionFactories:Ljava/util/List;

    if-eqz p1, :cond_3

    .line 156
    invoke-static {p2, p1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->calculateInlineParserExtensions(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/List;)Ljava/util/Map;

    move-result-object p1

    .line 157
    new-instance p2, Ljava/util/HashMap;

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v0

    invoke-direct {p2, v0}, Ljava/util/HashMap;-><init>(I)V

    iput-object p2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->inlineParserExtensions:Ljava/util/Map;

    .line 158
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 159
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 160
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 161
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vladsch/flexmark/parser/InlineParserExtensionFactory;

    .line 162
    invoke-interface {p2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vladsch/flexmark/parser/InlineParserExtension;

    if-nez v4, :cond_1

    .line 164
    invoke-interface {v3, p0}, Lcom/vladsch/flexmark/parser/InlineParserExtensionFactory;->create(Lcom/vladsch/flexmark/parser/InlineParser;)Lcom/vladsch/flexmark/parser/InlineParserExtension;

    move-result-object v4

    .line 165
    invoke-interface {p2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    :cond_1
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 170
    :cond_2
    iget-object v2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->inlineParserExtensions:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->specialCharacters:Ljava/util/BitSet;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Character;

    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v0

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->set(I)V

    goto :goto_1

    :cond_3
    return-void
.end method

.method public match(Ljava/util/regex/Pattern;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 3

    .line 775
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    const/4 v2, 0x0

    if-lt v0, v1, :cond_0

    return-object v2

    .line 778
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {p1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    .line 779
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Ljava/util/regex/Matcher;->region(II)Ljava/util/regex/Matcher;

    .line 780
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 782
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->end()I

    move-result v0

    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    .line 783
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->toMatchResult()Ljava/util/regex/MatchResult;

    move-result-object p1

    .line 784
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {p1}, Ljava/util/regex/MatchResult;->start()I

    move-result v1

    invoke-interface {p1}, Ljava/util/regex/MatchResult;->end()I

    move-result p1

    invoke-interface {v0, v1, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    return-object p1

    :cond_1
    return-object v2
.end method

.method public matchWithGroups(Ljava/util/regex/Pattern;)[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 8

    .line 798
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    const/4 v2, 0x0

    if-lt v0, v1, :cond_0

    return-object v2

    .line 801
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {p1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    .line 802
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Ljava/util/regex/Matcher;->region(II)Ljava/util/regex/Matcher;

    .line 803
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 805
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->end()I

    move-result v0

    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    .line 806
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->toMatchResult()Ljava/util/regex/MatchResult;

    move-result-object v0

    .line 807
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->groupCount()I

    move-result v1

    const/4 v3, 0x1

    add-int/2addr v1, v3

    .line 808
    new-array v4, v1, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 809
    iget-object v5, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0}, Ljava/util/regex/MatchResult;->start()I

    move-result v6

    invoke-interface {v0}, Ljava/util/regex/MatchResult;->end()I

    move-result v7

    invoke-interface {v5, v6, v7}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    :goto_0
    if-ge v3, v1, :cond_2

    .line 811
    invoke-virtual {p1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 812
    iget-object v5, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0, v3}, Ljava/util/regex/MatchResult;->start(I)I

    move-result v6

    invoke-interface {v0, v3}, Ljava/util/regex/MatchResult;->end(I)I

    move-result v7

    invoke-interface {v5, v6, v7}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v5

    aput-object v5, v4, v3

    goto :goto_1

    .line 814
    :cond_1
    aput-object v2, v4, v3

    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return-object v4

    :cond_3
    return-object v2
.end method

.method public matcher(Ljava/util/regex/Pattern;)Ljava/util/regex/Matcher;
    .locals 3

    .line 831
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    const/4 v2, 0x0

    if-lt v0, v1, :cond_0

    return-object v2

    .line 834
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {p1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    .line 835
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Ljava/util/regex/Matcher;->region(II)Ljava/util/regex/Matcher;

    .line 836
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 838
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->end()I

    move-result v0

    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    return-object p1

    :cond_1
    return-object v2
.end method

.method public mergeIfNeeded(Lcom/vladsch/flexmark/ast/Text;Lcom/vladsch/flexmark/ast/Text;)V
    .locals 3

    if-eqz p1, :cond_1

    if-eqz p2, :cond_1

    if-eq p1, p2, :cond_1

    .line 452
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 453
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Text;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 454
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Text;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v1

    .line 455
    invoke-virtual {p2}, Lcom/vladsch/flexmark/ast/Text;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p2

    :goto_0
    if-eq v1, p2, :cond_0

    .line 457
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 459
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v2

    .line 460
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    move-object v1, v2

    goto :goto_0

    .line 462
    :cond_0
    invoke-static {v0}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequence;->of(Ljava/util/List;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    .line 463
    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/ast/Text;->setChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    :cond_1
    return-void
.end method

.method public mergeTextNodes(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 4

    const/4 v0, 0x0

    move-object v1, v0

    move-object v2, v1

    :goto_0
    if-eqz p1, :cond_3

    .line 427
    instance-of v3, p1, Lcom/vladsch/flexmark/ast/Text;

    if-eqz v3, :cond_0

    .line 428
    move-object v2, p1

    check-cast v2, Lcom/vladsch/flexmark/ast/Text;

    if-nez v1, :cond_1

    move-object v1, v2

    goto :goto_1

    .line 434
    :cond_0
    invoke-virtual {p0, v1, v2}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->mergeIfNeeded(Lcom/vladsch/flexmark/ast/Text;Lcom/vladsch/flexmark/ast/Text;)V

    move-object v1, v0

    move-object v2, v1

    :cond_1
    :goto_1
    if-ne p1, p2, :cond_2

    goto :goto_2

    .line 443
    :cond_2
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    goto :goto_0

    .line 446
    :cond_3
    :goto_2
    invoke-virtual {p0, v1, v2}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->mergeIfNeeded(Lcom/vladsch/flexmark/ast/Text;Lcom/vladsch/flexmark/ast/Text;)V

    return-void
.end method

.method public moveNodes(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 2

    if-eq p1, p2, :cond_1

    .line 497
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    :goto_0
    if-eqz v0, :cond_1

    .line 499
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v1

    .line 500
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    .line 501
    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/util/ast/Node;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    if-ne v0, p2, :cond_0

    goto :goto_1

    :cond_0
    move-object v0, v1

    goto :goto_0

    .line 507
    :cond_1
    :goto_1
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->setCharsFromContent()V

    return-void
.end method

.method public nonIndentSp()Z
    .locals 1

    .line 884
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    iget-object v0, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->SPNI:Ljava/util/regex/Pattern;

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->match(Ljava/util/regex/Pattern;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v0, 0x1

    return v0
.end method

.method public parse(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 2

    .line 390
    iput-object p2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->block:Lcom/vladsch/flexmark/util/ast/Node;

    .line 391
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 p1, 0x0

    .line 392
    iput p1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    const/4 p1, 0x0

    .line 393
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->lastDelimiter:Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    .line 394
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->lastBracket:Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;

    .line 396
    instance-of v0, p2, Lcom/vladsch/flexmark/util/ast/DoNotDecorate;

    .line 400
    :cond_0
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->parseInline(Z)Z

    move-result v1

    if-nez v1, :cond_0

    .line 403
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->processDelimiters(Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)V

    .line 404
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->flushTextNode()Z

    if-nez v0, :cond_2

    .line 407
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->inlineParserExtensions:Ljava/util/Map;

    if-eqz p1, :cond_2

    .line 408
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 409
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/parser/InlineParserExtension;

    .line 410
    invoke-interface {v1, p0}, Lcom/vladsch/flexmark/parser/InlineParserExtension;->finalizeBlock(Lcom/vladsch/flexmark/parser/InlineParser;)V

    goto :goto_0

    .line 417
    :cond_2
    invoke-virtual {p2}, Lcom/vladsch/flexmark/util/ast/Node;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p1

    invoke-virtual {p2}, Lcom/vladsch/flexmark/util/ast/Node;->getLastChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->mergeTextNodes(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method public parseAutolink()Z
    .locals 7

    .line 1669
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    iget-object v0, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->EMAIL_AUTOLINK:Ljava/util/regex/Pattern;

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->match(Ljava/util/regex/Pattern;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    .line 1670
    new-instance v3, Lcom/vladsch/flexmark/ast/MailLink;

    invoke-interface {v0, v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-interface {v0, v2, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v4

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v5

    sub-int/2addr v5, v2

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v6

    invoke-interface {v0, v5, v6}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-direct {v3, v1, v4, v0}, Lcom/vladsch/flexmark/ast/MailLink;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 1671
    invoke-virtual {p0, v3}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->appendNode(Lcom/vladsch/flexmark/util/ast/Node;)V

    return v2

    .line 1673
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    iget-object v0, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->AUTOLINK:Ljava/util/regex/Pattern;

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->match(Ljava/util/regex/Pattern;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1674
    new-instance v3, Lcom/vladsch/flexmark/ast/AutoLink;

    invoke-interface {v0, v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-interface {v0, v2, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v4

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v5

    sub-int/2addr v5, v2

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v6

    invoke-interface {v0, v5, v6}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-direct {v3, v1, v4, v0}, Lcom/vladsch/flexmark/ast/AutoLink;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 1675
    invoke-virtual {p0, v3}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->appendNode(Lcom/vladsch/flexmark/util/ast/Node;)V

    return v2

    .line 1677
    :cond_1
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->options:Lcom/vladsch/flexmark/parser/InlineParserOptions;

    iget-boolean v0, v0, Lcom/vladsch/flexmark/parser/InlineParserOptions;->wwwAutoLinkElement:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    iget-object v0, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->WWW_AUTOLINK:Ljava/util/regex/Pattern;

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->match(Ljava/util/regex/Pattern;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 1678
    new-instance v3, Lcom/vladsch/flexmark/ast/AutoLink;

    invoke-interface {v0, v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-interface {v0, v2, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v4

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v5

    sub-int/2addr v5, v2

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v6

    invoke-interface {v0, v5, v6}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-direct {v3, v1, v4, v0}, Lcom/vladsch/flexmark/ast/AutoLink;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 1679
    invoke-virtual {p0, v3}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->appendNode(Lcom/vladsch/flexmark/util/ast/Node;)V

    return v2

    :cond_2
    return v1
.end method

.method protected parseBackslash()Z
    .locals 6

    .line 967
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    .line 968
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->peek()C

    move-result v0

    const/16 v2, 0xa

    if-eq v0, v2, :cond_2

    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->peek()C

    move-result v0

    const/16 v3, 0xd

    if-ne v0, v3, :cond_0

    goto :goto_0

    .line 972
    :cond_0
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    iget-object v2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v2

    if-ge v0, v2, :cond_1

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    iget-object v0, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->ESCAPABLE:Ljava/util/regex/Pattern;

    iget-object v2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v3, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/lit8 v4, v3, 0x1

    invoke-interface {v2, v3, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 973
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/lit8 v3, v2, -0x1

    add-int/2addr v2, v1

    invoke-virtual {p0, v0, v3, v2}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->appendText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;II)V

    .line 974
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    goto :goto_2

    .line 976
    :cond_1
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/lit8 v3, v2, -0x1

    invoke-interface {v0, v3, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->appendText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    goto :goto_2

    .line 969
    :cond_2
    :goto_0
    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->peek(I)C

    move-result v0

    if-ne v0, v2, :cond_3

    const/4 v0, 0x2

    goto :goto_1

    :cond_3
    const/4 v0, 0x1

    .line 970
    :goto_1
    new-instance v2, Lcom/vladsch/flexmark/ast/HardLineBreak;

    iget-object v3, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v4, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/lit8 v5, v4, -0x1

    add-int/2addr v4, v0

    invoke-interface {v3, v5, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/vladsch/flexmark/ast/HardLineBreak;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    invoke-virtual {p0, v2}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->appendNode(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 971
    iget v2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    :goto_2
    return v1
.end method

.method protected parseBackticks()Z
    .locals 9

    .line 987
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    iget-object v0, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->TICKS_HERE:Ljava/util/regex/Pattern;

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->match(Ljava/util/regex/Pattern;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 991
    :cond_0
    iget v2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    .line 993
    :cond_1
    iget-object v3, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    iget-object v3, v3, Lcom/vladsch/flexmark/ast/util/Parsing;->TICKS:Ljava/util/regex/Pattern;

    invoke-virtual {p0, v3}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->match(Ljava/util/regex/Pattern;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    const/4 v4, 0x1

    if-eqz v3, :cond_b

    .line 994
    invoke-virtual {v3, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 995
    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    .line 996
    iget-object v3, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    sub-int v5, v2, v0

    iget v6, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    sub-int/2addr v6, v0

    invoke-interface {v3, v5, v6}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 997
    iget-object v3, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v6, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    sub-int/2addr v6, v0

    invoke-interface {v3, v2, v6}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    .line 998
    new-instance v6, Lcom/vladsch/flexmark/ast/Code;

    iget-object v7, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v7, v5, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    iget-object v5, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v7, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    sub-int v0, v7, v0

    invoke-interface {v5, v0, v7}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-direct {v6, v2, v3, v0}, Lcom/vladsch/flexmark/ast/Code;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 1000
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->options:Lcom/vladsch/flexmark/parser/InlineParserOptions;

    iget-boolean v0, v0, Lcom/vladsch/flexmark/parser/InlineParserOptions;->codeSoftLineBreaks:Z

    if-eqz v0, :cond_9

    .line 1002
    invoke-interface {v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    :cond_2
    :goto_0
    if-ge v1, v0, :cond_a

    .line 1005
    const-string v2, "\n\r"

    invoke-interface {v3, v2, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->indexOfAny(Ljava/lang/CharSequence;I)I

    move-result v2

    const/4 v5, -0x1

    if-ne v2, v5, :cond_3

    move v5, v0

    goto :goto_1

    :cond_3
    move v5, v2

    .line 1009
    :goto_1
    new-instance v7, Lcom/vladsch/flexmark/ast/Text;

    invoke-interface {v3, v1, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-direct {v7, v1}, Lcom/vladsch/flexmark/ast/Text;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 1010
    invoke-virtual {v6, v7}, Lcom/vladsch/flexmark/ast/Code;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    if-lt v5, v0, :cond_4

    goto :goto_3

    .line 1014
    :cond_4
    invoke-interface {v3, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v1

    const/16 v7, 0xd

    if-ne v1, v7, :cond_6

    add-int/lit8 v1, v5, 0x1

    if-lt v1, v0, :cond_5

    goto :goto_3

    .line 1017
    :cond_5
    invoke-interface {v3, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v7

    const/16 v8, 0xa

    if-ne v7, v8, :cond_7

    add-int/lit8 v1, v5, 0x2

    goto :goto_2

    :cond_6
    add-int/lit8 v1, v5, 0x1

    :cond_7
    :goto_2
    if-lt v1, v0, :cond_8

    goto :goto_3

    :cond_8
    if-ge v5, v1, :cond_2

    .line 1025
    new-instance v5, Lcom/vladsch/flexmark/ast/SoftLineBreak;

    invoke-interface {v3, v2, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-direct {v5, v2}, Lcom/vladsch/flexmark/ast/SoftLineBreak;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 1026
    invoke-virtual {v6, v5}, Lcom/vladsch/flexmark/ast/Code;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    goto :goto_0

    .line 1030
    :cond_9
    new-instance v0, Lcom/vladsch/flexmark/ast/Text;

    invoke-direct {v0, v3}, Lcom/vladsch/flexmark/ast/Text;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 1031
    invoke-virtual {v6, v0}, Lcom/vladsch/flexmark/ast/Code;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 1034
    :cond_a
    :goto_3
    invoke-virtual {p0, v6}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->appendNode(Lcom/vladsch/flexmark/util/ast/Node;)V

    return v4

    .line 1040
    :cond_b
    iput v2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    .line 1041
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->appendText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    return v4
.end method

.method protected parseBang()Z
    .locals 6

    .line 1107
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/lit8 v1, v0, 0x1

    .line 1108
    iput v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    .line 1109
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->peek()C

    move-result v1

    const/16 v2, 0x5b

    const/4 v3, 0x1

    if-ne v1, v2, :cond_0

    .line 1110
    iget v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    .line 1112
    iget-object v4, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v4, v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->appendSeparateText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/ast/Text;

    move-result-object v1

    .line 1115
    iget-object v2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    add-int/2addr v0, v3

    iget-object v4, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->lastBracket:Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;

    iget-object v5, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->lastDelimiter:Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    invoke-static {v2, v1, v0, v4, v5}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->image(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/ast/Text;ILcom/vladsch/flexmark/parser/core/delimiter/Bracket;Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->addBracket(Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;)V

    goto :goto_0

    .line 1117
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/lit8 v2, v1, -0x1

    invoke-interface {v0, v2, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->appendText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    :goto_0
    return v3
.end method

.method protected parseCloseBracket()Z
    .locals 25

    move-object/from16 v0, p0

    .line 1195
    iget v1, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/lit8 v2, v1, 0x1

    iput v2, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    .line 1200
    iget-object v3, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->lastBracket:Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;

    const/4 v4, 0x1

    .line 1357
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    if-nez v3, :cond_0

    .line 1203
    iget-object v3, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v3, v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->appendText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    return v4

    .line 1207
    :cond_0
    invoke-virtual {v3}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->isAllowed()Z

    move-result v6

    if-nez v6, :cond_1

    .line 1209
    iget-object v1, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v2, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/lit8 v3, v2, -0x1

    invoke-interface {v1, v3, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->appendText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 1210
    invoke-direct {v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->removeLastBracket()V

    return v4

    .line 1224
    :cond_1
    sget-object v6, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 1225
    sget-object v7, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 1226
    sget-object v8, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 1230
    iget v9, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    .line 1233
    iget-object v10, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->options:Lcom/vladsch/flexmark/parser/InlineParserOptions;

    iget-boolean v10, v10, Lcom/vladsch/flexmark/parser/InlineParserOptions;->spaceInLinkElements:Z

    if-eqz v10, :cond_2

    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->peek()C

    move-result v10

    const/16 v11, 0x20

    if-ne v10, v11, :cond_2

    .line 1234
    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->sp()Z

    .line 1237
    :cond_2
    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->peek()C

    move-result v10

    const/16 v11, 0x28

    const/4 v13, 0x0

    if-ne v10, v11, :cond_a

    .line 1238
    iget v6, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    .line 1240
    iget-object v9, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    add-int/lit8 v10, v6, 0x1

    invoke-interface {v9, v6, v10}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v9

    .line 1241
    iget v10, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/2addr v10, v4

    iput v10, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    .line 1242
    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->spnl()Z

    .line 1243
    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->parseLinkDestination()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v10

    if-eqz v10, :cond_9

    .line 1244
    iget-object v11, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->options:Lcom/vladsch/flexmark/parser/InlineParserOptions;

    iget-boolean v11, v11, Lcom/vladsch/flexmark/parser/InlineParserOptions;->parseMultiLineImageUrls:Z

    const/16 v14, 0x29

    if-eqz v11, :cond_6

    invoke-virtual {v3}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->isImage()Z

    move-result v11

    if-eqz v11, :cond_6

    const-string v11, "<"

    invoke-interface {v10, v11}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->startsWith(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_6

    const-string v11, "?"

    invoke-interface {v10, v11}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->endsWith(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_6

    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->spnlUrl()Z

    move-result v11

    if-eqz v11, :cond_6

    .line 1246
    iget v11, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    move v6, v11

    .line 1251
    :goto_0
    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->sp()Z

    .line 1252
    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->parseLinkTitle()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v15

    if-eqz v15, :cond_3

    .line 1253
    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->sp()Z

    .line 1255
    :cond_3
    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->peek()C

    move-result v12

    if-ne v12, v14, :cond_4

    .line 1256
    iget-object v7, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v12, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/lit8 v14, v12, 0x1

    invoke-interface {v7, v12, v14}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v7

    .line 1257
    iget v12, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/2addr v12, v4

    iput v12, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    .line 1258
    iget-object v12, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v12, v11, v6}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v6

    const/4 v11, 0x1

    goto :goto_1

    .line 1264
    :cond_4
    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->toEOL()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v6

    if-nez v6, :cond_5

    const/4 v6, 0x0

    const/4 v11, 0x0

    const/4 v15, 0x0

    :goto_1
    move-object v4, v15

    const/16 v16, 0x1

    goto :goto_4

    .line 1266
    :cond_5
    iget v6, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    goto :goto_0

    .line 1269
    :cond_6
    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->spnl()Z

    .line 1271
    iget-object v11, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    iget-object v11, v11, Lcom/vladsch/flexmark/ast/util/Parsing;->WHITESPACE:Ljava/util/regex/Pattern;

    iget-object v12, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v15, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    const/16 v16, 0x1

    add-int/lit8 v4, v15, -0x1

    invoke-interface {v12, v4, v15}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v4

    invoke-virtual {v11, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->matches()Z

    move-result v4

    if-eqz v4, :cond_7

    .line 1272
    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->parseLinkTitle()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v4

    .line 1273
    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->spnl()Z

    goto :goto_2

    :cond_7
    const/4 v4, 0x0

    .line 1277
    :goto_2
    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->peek()C

    move-result v11

    if-ne v11, v14, :cond_8

    .line 1278
    iget-object v6, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v7, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/lit8 v11, v7, 0x1

    invoke-interface {v6, v7, v11}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v7

    .line 1279
    iget v6, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    const/4 v6, 0x0

    const/4 v11, 0x1

    goto :goto_4

    .line 1283
    :cond_8
    iput v6, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    goto :goto_3

    :cond_9
    const/16 v16, 0x1

    .line 1287
    iput v6, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    const/4 v4, 0x0

    :goto_3
    const/4 v6, 0x0

    const/4 v11, 0x0

    :goto_4
    move-object/from16 v24, v7

    move-object v7, v6

    move-object v6, v9

    move-object/from16 v9, v24

    goto :goto_5

    :cond_a
    const/16 v16, 0x1

    .line 1290
    iput v9, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    move-object v9, v7

    const/4 v4, 0x0

    const/4 v7, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    :goto_5
    if-nez v11, :cond_1d

    .line 1296
    iget-object v12, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->options:Lcom/vladsch/flexmark/parser/InlineParserOptions;

    iget-boolean v12, v12, Lcom/vladsch/flexmark/parser/InlineParserOptions;->matchLookaheadFirst:Z

    if-nez v12, :cond_b

    .line 1297
    invoke-direct {v0, v3, v2, v13, v13}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->matchLinkRef(Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;III)Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$ReferenceProcessorMatch;

    move-result-object v12

    goto :goto_6

    :cond_b
    const/4 v12, 0x0

    :goto_6
    if-eqz v12, :cond_c

    move-object/from16 v17, v8

    move/from16 v19, v11

    goto/16 :goto_b

    .line 1305
    :cond_c
    iget-object v14, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->linkRefProcessorsData:Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;

    iget v14, v14, Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;->maxNesting:I

    if-lez v14, :cond_f

    move-object v15, v3

    .line 1311
    :goto_7
    invoke-virtual {v15}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->getPrevious()Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;

    move-result-object v17

    if-eqz v17, :cond_e

    move-object/from16 v17, v8

    invoke-virtual {v15}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->getStartIndex()I

    move-result v8

    invoke-virtual {v15}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->getPrevious()Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->getStartIndex()I

    move-result v18

    move/from16 v19, v11

    add-int/lit8 v11, v18, 0x1

    if-ne v8, v11, :cond_10

    invoke-virtual {v0, v13}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->peek(I)C

    move-result v8

    const/16 v11, 0x5d

    if-ne v8, v11, :cond_10

    .line 1312
    invoke-virtual {v15}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->getPrevious()Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;

    move-result-object v15

    add-int/lit8 v13, v13, 0x1

    if-eq v13, v14, :cond_10

    .line 1314
    invoke-virtual {v15}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->isImage()Z

    move-result v8

    if-eqz v8, :cond_d

    goto :goto_8

    :cond_d
    move-object/from16 v8, v17

    move/from16 v11, v19

    goto :goto_7

    :cond_e
    move-object/from16 v17, v8

    move/from16 v19, v11

    goto :goto_8

    :cond_f
    move-object/from16 v17, v8

    move/from16 v19, v11

    const/4 v13, 0x0

    :cond_10
    :goto_8
    add-int/lit8 v13, v13, 0x1

    :goto_9
    add-int/lit8 v8, v13, -0x1

    if-lez v13, :cond_13

    const/4 v11, 0x0

    .line 1319
    invoke-direct {v0, v3, v2, v8, v11}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->matchLinkRef(Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;III)Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$ReferenceProcessorMatch;

    move-result-object v12

    if-eqz v12, :cond_12

    if-lez v8, :cond_13

    :goto_a
    add-int/lit8 v3, v8, -0x1

    if-lez v8, :cond_11

    .line 1324
    iget v8, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/lit8 v8, v8, 0x1

    iput v8, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    .line 1325
    iget-object v8, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->lastBracket:Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;

    invoke-virtual {v8}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->getNode()Lcom/vladsch/flexmark/ast/Text;

    move-result-object v8

    invoke-virtual {v8}, Lcom/vladsch/flexmark/ast/Text;->unlink()V

    .line 1326
    invoke-direct {v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->removeLastBracket()V

    move v8, v3

    goto :goto_a

    .line 1328
    :cond_11
    iget-object v3, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->lastBracket:Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;

    goto :goto_b

    :cond_12
    move v13, v8

    goto :goto_9

    :cond_13
    :goto_b
    if-nez v12, :cond_1c

    .line 1337
    iget v8, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    .line 1338
    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->parseLinkLabel()I

    move-result v11

    const/4 v13, 0x2

    if-le v11, v13, :cond_14

    .line 1340
    iget-object v13, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    add-int/2addr v11, v8

    invoke-interface {v13, v8, v11}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v11

    goto :goto_d

    .line 1341
    :cond_14
    invoke-virtual {v3}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->isBracketAfter()Z

    move-result v13

    if-nez v13, :cond_16

    .line 1343
    iget-object v13, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    add-int/2addr v11, v8

    invoke-interface {v13, v8, v11}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v11

    .line 1344
    invoke-virtual {v3}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->isImage()Z

    move-result v13

    if-eqz v13, :cond_15

    .line 1346
    iget-object v13, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {v3}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->getStartIndex()I

    move-result v14

    add-int/lit8 v14, v14, -0x1

    invoke-interface {v13, v14, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v13

    goto :goto_c

    .line 1348
    :cond_15
    iget-object v13, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {v3}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->getStartIndex()I

    move-result v14

    invoke-interface {v13, v14, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v13

    :goto_c
    move-object/from16 v17, v11

    move-object v11, v13

    const/4 v13, 0x1

    goto :goto_e

    :cond_16
    const/4 v11, 0x0

    :goto_d
    const/4 v13, 0x0

    :goto_e
    if-eqz v11, :cond_1b

    const/4 v14, 0x1

    .line 1354
    invoke-static {v11, v14}, Lcom/vladsch/flexmark/util/html/Escaping;->normalizeReferenceChars(Ljava/lang/CharSequence;Z)Ljava/lang/String;

    move-result-object v15

    .line 1355
    iget-object v14, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->referenceRepository:Lcom/vladsch/flexmark/ast/util/ReferenceRepository;

    invoke-virtual {v14, v15}, Lcom/vladsch/flexmark/ast/util/ReferenceRepository;->containsKey(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_18

    .line 1356
    iget-object v8, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {v3}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->getStartIndex()I

    move-result v14

    invoke-interface {v8, v14, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v8

    if-eqz v13, :cond_17

    move-object v8, v11

    .line 1357
    :cond_17
    invoke-virtual {v3}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->getNode()Lcom/vladsch/flexmark/ast/Text;

    move-result-object v14

    invoke-virtual {v14}, Lcom/vladsch/flexmark/ast/Text;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v14

    invoke-static {v8, v14, v5}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->containsLinkRefs(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/ast/Node;Ljava/lang/Boolean;)Z

    move-result v8

    const/16 v16, 0x1

    xor-int/lit8 v8, v8, 0x1

    move/from16 v19, v8

    move v14, v13

    move-object/from16 v8, v17

    const/4 v13, 0x1

    goto :goto_11

    .line 1362
    :cond_18
    invoke-virtual {v3, v11}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->isStraddling(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Z

    move-result v14

    if-nez v14, :cond_1b

    if-nez v13, :cond_1a

    .line 1366
    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->peek()C

    move-result v14

    const/16 v15, 0x5b

    if-ne v14, v15, :cond_1a

    .line 1368
    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->parseLinkLabel()I

    move-result v14

    if-lez v14, :cond_19

    .line 1371
    iput v8, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    const/4 v14, 0x0

    goto :goto_f

    .line 1374
    :cond_19
    invoke-virtual {v3}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->getNode()Lcom/vladsch/flexmark/ast/Text;

    move-result-object v8

    invoke-virtual {v8}, Lcom/vladsch/flexmark/ast/Text;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v8

    const/4 v14, 0x0

    invoke-static {v11, v8, v14}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->containsLinkRefs(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/ast/Node;Ljava/lang/Boolean;)Z

    move-result v8

    if-nez v8, :cond_1b

    const/4 v13, 0x1

    const/16 v19, 0x1

    goto :goto_f

    :cond_1a
    const/4 v14, 0x0

    .line 1382
    invoke-virtual {v3}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->getNode()Lcom/vladsch/flexmark/ast/Text;

    move-result-object v8

    invoke-virtual {v8}, Lcom/vladsch/flexmark/ast/Text;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v8

    invoke-static {v11, v8, v14}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->containsLinkRefs(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/ast/Node;Ljava/lang/Boolean;)Z

    move-result v8

    if-nez v8, :cond_1b

    move v14, v13

    move-object/from16 v8, v17

    const/4 v13, 0x0

    const/16 v19, 0x1

    goto :goto_11

    :cond_1b
    :goto_f
    move v14, v13

    move-object/from16 v8, v17

    const/4 v13, 0x0

    goto :goto_11

    :cond_1c
    move-object/from16 v8, v17

    const/4 v11, 0x0

    goto :goto_10

    :cond_1d
    move-object/from16 v17, v8

    move/from16 v19, v11

    const/4 v11, 0x0

    const/4 v12, 0x0

    :goto_10
    const/4 v13, 0x0

    const/4 v14, 0x0

    :goto_11
    if-nez v19, :cond_1f

    if-eqz v12, :cond_1e

    goto :goto_12

    .line 1526
    :cond_1e
    iput v2, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    .line 1527
    iget-object v3, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v3, v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->appendText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 1528
    invoke-direct {v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->removeLastBracket()V

    const/4 v1, 0x1

    return v1

    :cond_1f
    :goto_12
    const/4 v1, 0x1

    .line 1397
    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->flushTextNode()Z

    .line 1400
    invoke-virtual {v3}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->isImage()Z

    move-result v15

    if-eqz v12, :cond_21

    const/16 v16, 0x1

    .line 1403
    iget-boolean v1, v12, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$ReferenceProcessorMatch;->wantExclamation:Z

    if-nez v1, :cond_20

    if-eqz v15, :cond_20

    .line 1404
    iget-object v1, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {v3}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->getStartIndex()I

    move-result v15

    add-int/lit8 v15, v15, -0x1

    move-object/from16 v17, v3

    invoke-virtual/range {v17 .. v17}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->getStartIndex()I

    move-result v3

    invoke-interface {v1, v15, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->appendText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 1405
    invoke-virtual/range {v17 .. v17}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->getNode()Lcom/vladsch/flexmark/ast/Text;

    move-result-object v1

    invoke-virtual/range {v17 .. v17}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->getNode()Lcom/vladsch/flexmark/ast/Text;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vladsch/flexmark/ast/Text;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    const/4 v15, 0x1

    invoke-interface {v3, v15}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/vladsch/flexmark/ast/Text;->setChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    const/4 v15, 0x0

    goto :goto_13

    :cond_20
    move-object/from16 v17, v3

    .line 1410
    :goto_13
    iget-object v1, v12, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$ReferenceProcessorMatch;->processor:Lcom/vladsch/flexmark/parser/LinkRefProcessor;

    iget-object v3, v12, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$ReferenceProcessorMatch;->nodeChars:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1, v3}, Lcom/vladsch/flexmark/parser/LinkRefProcessor;->createNode(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v1

    goto :goto_14

    :cond_21
    move-object/from16 v17, v3

    if-eqz v11, :cond_23

    if-eqz v15, :cond_22

    .line 1412
    new-instance v1, Lcom/vladsch/flexmark/ast/ImageRef;

    invoke-direct {v1}, Lcom/vladsch/flexmark/ast/ImageRef;-><init>()V

    goto :goto_14

    :cond_22
    new-instance v1, Lcom/vladsch/flexmark/ast/LinkRef;

    invoke-direct {v1}, Lcom/vladsch/flexmark/ast/LinkRef;-><init>()V

    goto :goto_14

    :cond_23
    if-eqz v15, :cond_24

    new-instance v1, Lcom/vladsch/flexmark/ast/Image;

    invoke-direct {v1}, Lcom/vladsch/flexmark/ast/Image;-><init>()V

    goto :goto_14

    :cond_24
    new-instance v1, Lcom/vladsch/flexmark/ast/Link;

    invoke-direct {v1}, Lcom/vladsch/flexmark/ast/Link;-><init>()V

    .line 1416
    :goto_14
    invoke-virtual/range {v17 .. v17}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->getNode()Lcom/vladsch/flexmark/ast/Text;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vladsch/flexmark/ast/Text;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v3

    :goto_15
    if-eqz v3, :cond_25

    .line 1418
    invoke-virtual {v3}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v18

    .line 1419
    invoke-virtual {v1, v3}, Lcom/vladsch/flexmark/util/ast/Node;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    move-object/from16 v3, v18

    goto :goto_15

    :cond_25
    if-eqz v12, :cond_2b

    .line 1426
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->hasChildren()Z

    move-result v3

    if-eqz v3, :cond_2b

    .line 1427
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->getChildChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    move/from16 v18, v13

    .line 1428
    iget-object v13, v12, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$ReferenceProcessorMatch;->processor:Lcom/vladsch/flexmark/parser/LinkRefProcessor;

    move/from16 v19, v14

    iget-object v14, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->document:Lcom/vladsch/flexmark/util/ast/Document;

    invoke-interface {v13, v14, v1}, Lcom/vladsch/flexmark/parser/LinkRefProcessor;->adjustInlineText(Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/util/ast/Node;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v13

    .line 1431
    iget-object v14, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->lastDelimiter:Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    :goto_16
    if-eqz v14, :cond_28

    .line 1433
    invoke-virtual {v14}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getPrevious()Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    move-result-object v20

    move/from16 v21, v15

    .line 1435
    invoke-virtual {v14}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getInput()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v15

    move-object/from16 v22, v5

    invoke-virtual {v14}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getStartIndex()I

    move-result v5

    move-object/from16 v23, v7

    invoke-virtual {v14}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getEndIndex()I

    move-result v7

    invoke-interface {v15, v5, v7}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v5

    .line 1436
    invoke-interface {v3, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->containsAllOf(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Z

    move-result v7

    if-eqz v7, :cond_27

    .line 1437
    invoke-interface {v13, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->containsAllOf(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Z

    move-result v7

    if-eqz v7, :cond_26

    iget-object v7, v12, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$ReferenceProcessorMatch;->processor:Lcom/vladsch/flexmark/parser/LinkRefProcessor;

    iget-object v15, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->document:Lcom/vladsch/flexmark/util/ast/Document;

    invoke-interface {v7, v5, v15, v1}, Lcom/vladsch/flexmark/parser/LinkRefProcessor;->allowDelimiters(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/util/ast/Node;)Z

    move-result v5

    if-nez v5, :cond_27

    .line 1439
    :cond_26
    invoke-virtual {v0, v14}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->removeDelimiterKeepNode(Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)V

    :cond_27
    move-object/from16 v14, v20

    move/from16 v15, v21

    move-object/from16 v5, v22

    move-object/from16 v7, v23

    goto :goto_16

    :cond_28
    move-object/from16 v22, v5

    move-object/from16 v23, v7

    move/from16 v21, v15

    .line 1446
    invoke-interface {v13, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->containsAllOf(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Z

    move-result v3

    if-nez v3, :cond_2c

    .line 1448
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->getChildren()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    move-result-object v3

    invoke-interface {v3}, Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    move-result-object v3

    :cond_29
    :goto_17
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vladsch/flexmark/util/ast/Node;

    .line 1449
    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v7

    .line 1450
    invoke-interface {v13, v7}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->containsSomeOf(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Z

    move-result v14

    if-eqz v14, :cond_2a

    .line 1451
    invoke-interface {v13, v7}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->containsAllOf(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Z

    move-result v14

    if-nez v14, :cond_29

    .line 1453
    invoke-interface {v13, v7}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->intersect(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v7

    .line 1454
    invoke-virtual {v5, v7}, Lcom/vladsch/flexmark/util/ast/Node;->setChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    goto :goto_17

    .line 1458
    :cond_2a
    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    goto :goto_17

    :cond_2b
    move-object/from16 v22, v5

    move-object/from16 v23, v7

    move/from16 v18, v13

    move/from16 v19, v14

    move/from16 v21, v15

    .line 1464
    :cond_2c
    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->appendNode(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 1466
    instance-of v3, v1, Lcom/vladsch/flexmark/ast/RefNode;

    if-eqz v3, :cond_31

    .line 1468
    move-object v4, v1

    check-cast v4, Lcom/vladsch/flexmark/ast/RefNode;

    .line 1469
    invoke-virtual {v4, v11}, Lcom/vladsch/flexmark/ast/RefNode;->setReferenceChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    const/4 v15, 0x1

    if-eqz v18, :cond_2d

    .line 1470
    invoke-virtual {v4, v15}, Lcom/vladsch/flexmark/ast/RefNode;->setDefined(Z)V

    :cond_2d
    if-nez v19, :cond_2f

    .line 1473
    iget-object v5, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual/range {v17 .. v17}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->getStartIndex()I

    move-result v6

    if-eqz v21, :cond_2e

    sub-int/2addr v6, v15

    :cond_2e
    invoke-interface {v5, v6, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-virtual {v4, v2}, Lcom/vladsch/flexmark/ast/RefNode;->setTextChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    goto :goto_18

    .line 1474
    :cond_2f
    invoke-interface {v8}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_30

    const/4 v11, 0x0

    .line 1475
    invoke-interface {v8, v11, v15}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-virtual {v4, v2}, Lcom/vladsch/flexmark/ast/RefNode;->setTextOpeningMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 1476
    invoke-interface {v8, v15}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->endSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-virtual {v4, v2}, Lcom/vladsch/flexmark/ast/RefNode;->setTextClosingMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 1478
    :cond_30
    :goto_18
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->setCharsFromContent()V

    goto :goto_19

    .line 1479
    :cond_31
    instance-of v5, v1, Lcom/vladsch/flexmark/ast/InlineLinkNode;

    if-eqz v5, :cond_34

    .line 1481
    move-object v5, v1

    check-cast v5, Lcom/vladsch/flexmark/ast/InlineLinkNode;

    .line 1482
    invoke-virtual {v5, v10}, Lcom/vladsch/flexmark/ast/InlineLinkNode;->setUrlChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 1483
    invoke-virtual {v5, v4}, Lcom/vladsch/flexmark/ast/InlineLinkNode;->setTitleChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 1484
    invoke-virtual {v5, v6}, Lcom/vladsch/flexmark/ast/InlineLinkNode;->setLinkOpeningMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 1485
    invoke-virtual {v5, v9}, Lcom/vladsch/flexmark/ast/InlineLinkNode;->setLinkClosingMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 1486
    iget-object v4, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual/range {v17 .. v17}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->getStartIndex()I

    move-result v6

    if-eqz v21, :cond_32

    const/16 v16, 0x1

    add-int/lit8 v6, v6, -0x1

    :cond_32
    invoke-interface {v4, v6, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-virtual {v5, v2}, Lcom/vladsch/flexmark/ast/InlineLinkNode;->setTextChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    if-eqz v23, :cond_33

    .line 1489
    move-object v2, v1

    check-cast v2, Lcom/vladsch/flexmark/ast/Image;

    move-object/from16 v6, v23

    invoke-virtual {v2, v6}, Lcom/vladsch/flexmark/ast/Image;->setUrlContent(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 1492
    :cond_33
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->setCharsFromContent()V

    .line 1496
    :cond_34
    :goto_19
    invoke-virtual/range {v17 .. v17}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->getPreviousDelimiter()Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->processDelimiters(Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)V

    .line 1497
    invoke-virtual/range {v17 .. v17}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->getNode()Lcom/vladsch/flexmark/ast/Text;

    move-result-object v2

    .line 1498
    invoke-direct {v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->removeLastBracket()V

    if-eqz v12, :cond_35

    .line 1501
    iget-object v4, v12, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$ReferenceProcessorMatch;->processor:Lcom/vladsch/flexmark/parser/LinkRefProcessor;

    iget-object v5, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->document:Lcom/vladsch/flexmark/util/ast/Document;

    invoke-interface {v4, v5, v1}, Lcom/vladsch/flexmark/parser/LinkRefProcessor;->updateNodeElements(Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 1505
    :cond_35
    instance-of v4, v1, Lcom/vladsch/flexmark/ast/Link;

    if-eqz v4, :cond_38

    .line 1506
    iget-object v3, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->lastBracket:Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;

    :goto_1a
    if-eqz v3, :cond_37

    .line 1508
    invoke-virtual {v3}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->isImage()Z

    move-result v4

    const/4 v11, 0x0

    if-nez v4, :cond_36

    .line 1510
    invoke-virtual {v3, v11}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->setAllowed(Z)V

    .line 1512
    :cond_36
    invoke-virtual {v3}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->getPrevious()Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;

    move-result-object v3

    goto :goto_1a

    :cond_37
    const/4 v14, 0x0

    const/4 v15, 0x1

    .line 1517
    invoke-static {v1, v14, v15}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->collapseLinkRefChildren(Lcom/vladsch/flexmark/util/ast/Node;Ljava/lang/Boolean;Z)V

    goto :goto_1b

    :cond_38
    const/4 v15, 0x1

    if-eqz v3, :cond_39

    move-object/from16 v3, v22

    .line 1520
    invoke-static {v1, v3, v15}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->collapseLinkRefChildren(Lcom/vladsch/flexmark/util/ast/Node;Ljava/lang/Boolean;Z)V

    .line 1523
    :cond_39
    :goto_1b
    invoke-virtual {v2}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    return v15
.end method

.method public parseCustom(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/ast/Node;Ljava/util/BitSet;Ljava/util/Map;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            "Ljava/util/BitSet;",
            "Ljava/util/Map<",
            "Ljava/lang/Character;",
            "Lcom/vladsch/flexmark/parser/block/CharacterNodeFactory;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation

    .line 374
    iput-object p3, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->customCharacters:Ljava/util/BitSet;

    .line 375
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->specialCharacters:Ljava/util/BitSet;

    invoke-virtual {v0, p3}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 376
    iput-object p4, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->customSpecialCharacterFactoryMap:Ljava/util/Map;

    const/4 p3, 0x0

    .line 377
    iput-object p3, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->customSpecialCharacterNodes:Ljava/util/ArrayList;

    .line 378
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->parse(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 379
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->originalSpecialCharacters:Ljava/util/BitSet;

    iput-object p1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->specialCharacters:Ljava/util/BitSet;

    .line 380
    iput-object p3, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->customSpecialCharacterFactoryMap:Ljava/util/Map;

    .line 381
    iput-object p3, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->customCharacters:Ljava/util/BitSet;

    .line 382
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->customSpecialCharacterNodes:Ljava/util/ArrayList;

    return-object p1
.end method

.method protected parseDelimiters(Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;C)Z
    .locals 9

    .line 1065
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->scanDelimiters(Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;C)Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$DelimiterData;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 1069
    :cond_0
    iget v0, p1, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$DelimiterData;->count:I

    .line 1070
    iget v8, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int v1, v8, v0

    .line 1072
    iput v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    .line 1073
    iget-object v2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v2, v8, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->appendSeparateText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/ast/Text;

    move-result-object v3

    .line 1076
    new-instance v1, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    iget-object v2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-boolean v5, p1, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$DelimiterData;->canOpen:Z

    iget-boolean v6, p1, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$DelimiterData;->canClose:Z

    iget-object v7, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->lastDelimiter:Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    move v4, p2

    invoke-direct/range {v1 .. v8}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/ast/Text;CZZLcom/vladsch/flexmark/parser/core/delimiter/Delimiter;I)V

    iput-object v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->lastDelimiter:Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    .line 1077
    invoke-virtual {v1, v0}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->setNumDelims(I)V

    .line 1078
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->lastDelimiter:Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getPrevious()Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 1079
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->lastDelimiter:Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getPrevious()Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    move-result-object p1

    iget-object p2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->lastDelimiter:Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->setNext(Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)V

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public parseEntity()Z
    .locals 2

    .line 1717
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    iget-object v0, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->ENTITY_HERE:Ljava/util/regex/Pattern;

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->match(Ljava/util/regex/Pattern;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1718
    new-instance v1, Lcom/vladsch/flexmark/ast/HtmlEntity;

    invoke-direct {v1, v0}, Lcom/vladsch/flexmark/ast/HtmlEntity;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 1719
    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->appendNode(Lcom/vladsch/flexmark/util/ast/Node;)V

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public parseHtmlInline()Z
    .locals 2

    .line 1693
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    iget-object v0, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->HTML_TAG:Ljava/util/regex/Pattern;

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->match(Ljava/util/regex/Pattern;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1697
    const-string v1, "<!--"

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->startsWith(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "-->"

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->endsWith(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1698
    new-instance v1, Lcom/vladsch/flexmark/ast/HtmlInlineComment;

    invoke-direct {v1, v0}, Lcom/vladsch/flexmark/ast/HtmlInlineComment;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    goto :goto_0

    .line 1700
    :cond_0
    new-instance v1, Lcom/vladsch/flexmark/ast/HtmlInline;

    invoke-direct {v1, v0}, Lcom/vladsch/flexmark/ast/HtmlInline;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 1702
    :goto_0
    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->appendNode(Lcom/vladsch/flexmark/util/ast/Node;)V

    const/4 v0, 0x1

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method protected parseInline()Z
    .locals 1

    const/4 v0, 0x0

    .line 632
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->parseInline(Z)Z

    move-result v0

    return v0
.end method

.method protected parseInline(Z)Z
    .locals 4

    .line 638
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->peek()C

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    const/4 v2, 0x1

    if-nez p1, :cond_2

    .line 643
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->inlineParserExtensions:Ljava/util/Map;

    if-eqz p1, :cond_2

    .line 644
    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v3

    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_2

    .line 646
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vladsch/flexmark/parser/InlineParserExtension;

    .line 647
    invoke-interface {v3, p0}, Lcom/vladsch/flexmark/parser/InlineParserExtension;->parse(Lcom/vladsch/flexmark/parser/InlineParser;)Z

    move-result v3

    if-eqz v3, :cond_1

    return v2

    .line 653
    :cond_2
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->customCharacters:Ljava/util/BitSet;

    if-eqz p1, :cond_4

    invoke-virtual {p1, v0}, Ljava/util/BitSet;->get(I)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 654
    invoke-direct {p0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->processCustomCharacters()Z

    move-result p1

    if-nez p1, :cond_3

    .line 656
    iget p1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/lit8 v0, p1, 0x1

    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    .line 659
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1, p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->appendText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    :cond_3
    return v2

    :cond_4
    const/16 p1, 0xa

    if-eq v0, p1, :cond_d

    const/16 p1, 0xd

    if-eq v0, p1, :cond_d

    const/16 p1, 0x21

    if-eq v0, p1, :cond_c

    const/16 p1, 0x26

    if-eq v0, p1, :cond_b

    const/16 p1, 0x3c

    if-eq v0, p1, :cond_7

    const/16 p1, 0x60

    if-eq v0, p1, :cond_6

    packed-switch v0, :pswitch_data_0

    .line 701
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->delimiterCharacters:Ljava/util/BitSet;

    invoke-virtual {p1, v0}, Ljava/util/BitSet;->get(I)Z

    move-result p1

    if-eqz p1, :cond_5

    .line 703
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->delimiterProcessors:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;

    .line 704
    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->parseDelimiters(Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;C)Z

    move-result p1

    goto :goto_0

    .line 706
    :cond_5
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->parseString()Z

    move-result p1

    goto :goto_0

    .line 683
    :pswitch_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->parseCloseBracket()Z

    move-result p1

    goto :goto_0

    .line 671
    :pswitch_1
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->parseBackslash()Z

    move-result p1

    goto :goto_0

    .line 677
    :pswitch_2
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->parseOpenBracket()Z

    move-result p1

    goto :goto_0

    .line 674
    :cond_6
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->parseBackticks()Z

    move-result p1

    goto :goto_0

    .line 687
    :cond_7
    iget-object v3, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->delimiterCharacters:Ljava/util/BitSet;

    invoke-virtual {v3, v0}, Ljava/util/BitSet;->get(I)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 688
    invoke-virtual {p0, v2}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->peek(I)C

    move-result v3

    if-ne v3, p1, :cond_8

    .line 689
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->delimiterProcessors:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;

    .line 690
    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->parseDelimiters(Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;C)Z

    move-result p1

    goto :goto_0

    .line 692
    :cond_8
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->parseAutolink()Z

    move-result p1

    if-nez p1, :cond_9

    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->parseHtmlInline()Z

    move-result p1

    if-eqz p1, :cond_a

    :cond_9
    const/4 v1, 0x1

    :cond_a
    move p1, v1

    goto :goto_0

    .line 697
    :cond_b
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->parseEntity()Z

    move-result p1

    goto :goto_0

    .line 680
    :cond_c
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->parseBang()Z

    move-result p1

    goto :goto_0

    .line 668
    :cond_d
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->parseNewline()Z

    move-result p1

    :goto_0
    if-nez p1, :cond_e

    .line 713
    iget p1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/lit8 v0, p1, 0x1

    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    .line 716
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1, p1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->appendText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    :cond_e
    return v2

    nop

    :pswitch_data_0
    .packed-switch 0x5b
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public parseLinkDestination()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 8

    .line 1592
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    iget-object v0, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->LINK_DESTINATION_ANGLES:Ljava/util/regex/Pattern;

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->match(Ljava/util/regex/Pattern;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    .line 1596
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->options:Lcom/vladsch/flexmark/parser/InlineParserOptions;

    iget-boolean v0, v0, Lcom/vladsch/flexmark/parser/InlineParserOptions;->linksAllowMatchedParentheses:Z

    if-eqz v0, :cond_8

    .line 1598
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    iget-object v0, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->LINK_DESTINATION_MATCHED_PARENS:Ljava/util/regex/Pattern;

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->match(Ljava/util/regex/Pattern;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 1601
    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v3, v1, :cond_5

    .line 1603
    invoke-interface {v0, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v5

    const/16 v6, 0x5c

    if-ne v5, v6, :cond_1

    add-int/lit8 v5, v3, 0x1

    if-ge v5, v1, :cond_4

    .line 1605
    iget-object v6, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    iget-object v6, v6, Lcom/vladsch/flexmark/ast/util/Parsing;->ESCAPABLE:Ljava/util/regex/Pattern;

    add-int/lit8 v7, v3, 0x2

    invoke-interface {v0, v5, v7}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/regex/Matcher;->matches()Z

    move-result v6

    if-eqz v6, :cond_4

    move v3, v5

    goto :goto_1

    :cond_1
    const/16 v6, 0x28

    if-ne v5, v6, :cond_2

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_2
    const/16 v6, 0x29

    if-ne v5, v6, :cond_4

    if-nez v4, :cond_3

    .line 1614
    iget v4, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    sub-int/2addr v1, v3

    sub-int/2addr v4, v1

    iput v4, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    .line 1615
    invoke-interface {v0, v2, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    goto :goto_2

    :cond_3
    add-int/lit8 v4, v4, -0x1

    :cond_4
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1622
    :cond_5
    :goto_2
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->options:Lcom/vladsch/flexmark/parser/InlineParserOptions;

    iget-boolean v1, v1, Lcom/vladsch/flexmark/parser/InlineParserOptions;->spaceInLinkUrls:Z

    if-eqz v1, :cond_6

    sget-object v1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->SPACE:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trimEnd(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    :cond_6
    return-object v0

    :cond_7
    const/4 v0, 0x0

    return-object v0

    .line 1628
    :cond_8
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    iget-object v0, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->LINK_DESTINATION:Ljava/util/regex/Pattern;

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->match(Ljava/util/regex/Pattern;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    if-eqz v0, :cond_9

    .line 1629
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->options:Lcom/vladsch/flexmark/parser/InlineParserOptions;

    iget-boolean v1, v1, Lcom/vladsch/flexmark/parser/InlineParserOptions;->spaceInLinkUrls:Z

    if-eqz v1, :cond_9

    sget-object v1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->SPACE:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trimEnd(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    :cond_9
    return-object v0
.end method

.method public parseLinkLabel()I
    .locals 1

    .line 1657
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    iget-object v0, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->LINK_LABEL:Ljava/util/regex/Pattern;

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->match(Ljava/util/regex/Pattern;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 1658
    :cond_0
    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    return v0
.end method

.method public parseLinkTitle()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 1641
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    iget-object v0, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->LINK_TITLE:Ljava/util/regex/Pattern;

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->match(Ljava/util/regex/Pattern;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public parseNewline()Z
    .locals 10

    .line 926
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    const/4 v3, 0x0

    if-ge v0, v1, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/2addr v1, v2

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v0

    const/16 v1, 0xa

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 928
    :goto_0
    iget v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/lit8 v4, v0, 0x1

    add-int/2addr v1, v4

    iput v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    .line 931
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->flushTextNode()Z

    .line 933
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->block:Lcom/vladsch/flexmark/util/ast/Node;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->getLastChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v1

    .line 936
    instance-of v4, v1, Lcom/vladsch/flexmark/ast/Text;

    if-eqz v4, :cond_5

    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v4

    const-string v5, " "

    invoke-interface {v4, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->endsWith(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 937
    move-object v4, v1

    check-cast v4, Lcom/vladsch/flexmark/ast/Text;

    .line 938
    invoke-virtual {v4}, Lcom/vladsch/flexmark/ast/Text;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v4

    .line 939
    iget-object v5, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    iget-object v5, v5, Lcom/vladsch/flexmark/ast/util/Parsing;->FINAL_SPACE:Ljava/util/regex/Pattern;

    invoke-virtual {v5, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    .line 940
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->find()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-virtual {v5}, Ljava/util/regex/Matcher;->end()I

    move-result v6

    invoke-virtual {v5}, Ljava/util/regex/Matcher;->start()I

    move-result v5

    sub-int/2addr v6, v5

    goto :goto_1

    :cond_1
    const/4 v6, 0x0

    :goto_1
    const/4 v5, 0x2

    if-lt v6, v5, :cond_3

    .line 941
    new-instance v5, Lcom/vladsch/flexmark/ast/HardLineBreak;

    iget-object v7, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v8, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    iget-object v9, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->options:Lcom/vladsch/flexmark/parser/InlineParserOptions;

    iget-boolean v9, v9, Lcom/vladsch/flexmark/parser/InlineParserOptions;->hardLineBreakLimit:Z

    if-eqz v9, :cond_2

    add-int/lit8 v0, v0, 0x3

    goto :goto_2

    :cond_2
    add-int/lit8 v9, v6, 0x1

    add-int/2addr v0, v9

    :goto_2
    sub-int/2addr v8, v0

    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    invoke-interface {v7, v8, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-direct {v5, v0}, Lcom/vladsch/flexmark/ast/HardLineBreak;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    goto :goto_3

    :cond_3
    new-instance v5, Lcom/vladsch/flexmark/ast/SoftLineBreak;

    iget-object v7, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v8, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/lit8 v9, v8, -0x1

    sub-int/2addr v9, v0

    invoke-interface {v7, v9, v8}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-direct {v5, v0}, Lcom/vladsch/flexmark/ast/SoftLineBreak;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    :goto_3
    invoke-virtual {p0, v5}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->appendNode(Lcom/vladsch/flexmark/util/ast/Node;)V

    if-lez v6, :cond_6

    .line 943
    invoke-interface {v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    if-le v0, v6, :cond_4

    .line 944
    invoke-interface {v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    sub-int/2addr v0, v6

    invoke-interface {v4, v3, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trimEnd()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/vladsch/flexmark/util/ast/Node;->setChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    goto :goto_4

    .line 946
    :cond_4
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    goto :goto_4

    .line 950
    :cond_5
    new-instance v1, Lcom/vladsch/flexmark/ast/SoftLineBreak;

    iget-object v3, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v4, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/lit8 v5, v4, -0x1

    sub-int/2addr v5, v0

    invoke-interface {v3, v5, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/vladsch/flexmark/ast/SoftLineBreak;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->appendNode(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 954
    :cond_6
    :goto_4
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->peek()C

    move-result v0

    const/16 v1, 0x20

    if-ne v0, v1, :cond_7

    .line 955
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/2addr v0, v2

    iput v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    goto :goto_4

    :cond_7
    return v2
.end method

.method protected parseOpenBracket()Z
    .locals 5

    .line 1090
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/lit8 v1, v0, 0x1

    .line 1091
    iput v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    .line 1093
    iget-object v2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v2, v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->appendSeparateText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/ast/Text;

    move-result-object v1

    .line 1096
    iget-object v2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget-object v3, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->lastBracket:Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;

    iget-object v4, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->lastDelimiter:Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    invoke-static {v2, v1, v0, v3, v4}, Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;->link(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/ast/Text;ILcom/vladsch/flexmark/parser/core/delimiter/Bracket;Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->addBracket(Lcom/vladsch/flexmark/parser/core/delimiter/Bracket;)V

    const/4 v0, 0x1

    return v0
.end method

.method protected parseReference(Lcom/vladsch/flexmark/util/ast/Block;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)I
    .locals 7

    .line 518
    iput-object p2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 p2, 0x0

    .line 519
    iput p2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    .line 526
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->parseLinkLabel()I

    move-result v0

    if-nez v0, :cond_0

    return p2

    .line 532
    :cond_0
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->peek()C

    move-result v1

    const/16 v2, 0x3a

    if-eq v1, v2, :cond_1

    return p2

    .line 536
    :cond_1
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v2, 0x1

    add-int/2addr v0, v2

    invoke-interface {v1, p2, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    .line 537
    iget v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/2addr v1, v2

    iput v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    .line 540
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->spnl()Z

    .line 542
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->parseLinkDestination()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    if-eqz v1, :cond_9

    .line 543
    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v3

    if-nez v3, :cond_2

    goto :goto_2

    .line 547
    :cond_2
    iget v3, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    .line 548
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->spnl()Z

    .line 549
    invoke-virtual {p0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->parseLinkTitle()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v4

    if-nez v4, :cond_3

    .line 552
    iput v3, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    .line 556
    :cond_3
    iget v5, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    iget-object v6, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v6}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v6

    if-eq v5, v6, :cond_6

    iget-object v5, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    iget-object v5, v5, Lcom/vladsch/flexmark/ast/util/Parsing;->LINE_END:Ljava/util/regex/Pattern;

    invoke-virtual {p0, v5}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->match(Ljava/util/regex/Pattern;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v5

    if-nez v5, :cond_6

    if-nez v4, :cond_4

    const/4 v3, 0x0

    goto :goto_1

    .line 565
    :cond_4
    iput v3, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    .line 567
    iget-object v3, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    iget-object v3, v3, Lcom/vladsch/flexmark/ast/util/Parsing;->LINE_END:Ljava/util/regex/Pattern;

    invoke-virtual {p0, v3}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->match(Ljava/util/regex/Pattern;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    if-eqz v3, :cond_5

    const/4 v3, 0x1

    goto :goto_0

    :cond_5
    const/4 v3, 0x0

    :goto_0
    const/4 v4, 0x0

    goto :goto_1

    :cond_6
    const/4 v3, 0x1

    :goto_1
    if-nez v3, :cond_7

    return p2

    .line 575
    :cond_7
    invoke-static {v0, v2}, Lcom/vladsch/flexmark/util/html/Escaping;->normalizeReferenceChars(Ljava/lang/CharSequence;Z)Ljava/lang/String;

    move-result-object v2

    .line 576
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_8

    return p2

    .line 580
    :cond_8
    new-instance p2, Lcom/vladsch/flexmark/ast/Reference;

    invoke-direct {p2, v0, v1, v4}, Lcom/vladsch/flexmark/ast/Reference;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 584
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->referenceRepository:Lcom/vladsch/flexmark/ast/util/ReferenceRepository;

    invoke-virtual {v0, v2, p2}, Lcom/vladsch/flexmark/ast/util/ReferenceRepository;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 586
    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/util/ast/Block;->insertBefore(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 588
    iget p1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    return p1

    :cond_9
    :goto_2
    return p2
.end method

.method protected parseString()Z
    .locals 6

    .line 1732
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    .line 1733
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    .line 1734
    :goto_0
    iget v2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    const/4 v3, 0x1

    if-eq v2, v1, :cond_1

    .line 1735
    iget-object v4, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->specialCharacters:Ljava/util/BitSet;

    iget-object v5, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v5, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v2

    invoke-virtual {v4, v2}, Ljava/util/BitSet;->get(I)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_1

    .line 1738
    :cond_0
    iget v2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/2addr v2, v3

    iput v2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    goto :goto_0

    .line 1740
    :cond_1
    :goto_1
    iget v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    if-eq v0, v1, :cond_2

    .line 1741
    iget-object v2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {p0, v2, v0, v1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->appendText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;II)V

    return v3

    :cond_2
    const/4 v0, 0x0

    return v0
.end method

.method public peek()C
    .locals 2

    .line 850
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 851
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public peek(I)C
    .locals 2

    .line 859
    iget v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/2addr v0, p1

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 860
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    iget v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/2addr v1, p1

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public preProcessBlock(Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/parser/block/ParserState;)I
    .locals 5

    .line 472
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Paragraph;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    .line 475
    const-string v0, " \t"

    invoke-interface {p2, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->countLeading(Ljava/lang/CharSequence;)I

    move-result v1

    .line 476
    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v2

    :goto_0
    const/4 v3, 0x3

    if-gt v1, v3, :cond_2

    add-int/lit8 v3, v1, 0x3

    if-le v2, v3, :cond_2

    .line 478
    invoke-interface {p2, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v3

    const/16 v4, 0x5b

    if-ne v3, v4, :cond_2

    if-lez v1, :cond_0

    .line 480
    invoke-interface {p2, v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    sub-int/2addr v2, v1

    .line 484
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->parseReference(Lcom/vladsch/flexmark/util/ast/Block;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)I

    move-result v1

    if-nez v1, :cond_1

    goto :goto_1

    .line 486
    :cond_1
    invoke-interface {p2, v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    .line 487
    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v2

    .line 488
    invoke-interface {p2, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->countLeading(Ljava/lang/CharSequence;)I

    move-result v1

    goto :goto_0

    .line 491
    :cond_2
    :goto_1
    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result p2

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Paragraph;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result p1

    sub-int/2addr p2, p1

    return p2
.end method

.method public processDelimiters(Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)V
    .locals 10

    .line 1823
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1826
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->lastDelimiter:Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    :goto_0
    if-eqz v1, :cond_0

    .line 1827
    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getPrevious()Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    move-result-object v2

    if-eq v2, p1, :cond_0

    .line 1828
    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getPrevious()Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    move-result-object v1

    goto :goto_0

    :cond_0
    :goto_1
    if-eqz v1, :cond_9

    .line 1833
    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getDelimiterChar()C

    move-result v2

    .line 1835
    iget-object v3, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->delimiterProcessors:Ljava/util/Map;

    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;

    .line 1836
    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->canClose()Z

    move-result v4

    if-eqz v4, :cond_8

    if-nez v3, :cond_1

    goto/16 :goto_5

    .line 1841
    :cond_1
    invoke-interface {v3}, Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;->getOpeningCharacter()C

    move-result v4

    .line 1847
    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getPrevious()Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    :goto_2
    if-eqz v5, :cond_3

    if-eq v5, p1, :cond_3

    .line 1848
    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v9

    invoke-interface {v0, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    if-eq v5, v9, :cond_3

    .line 1849
    invoke-virtual {v5}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->canOpen()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-virtual {v5}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getDelimiterChar()C

    move-result v9

    if-ne v9, v4, :cond_2

    .line 1851
    invoke-interface {v3, v5, v1}, Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;->getDelimiterUse(Lcom/vladsch/flexmark/parser/delimiter/DelimiterRun;Lcom/vladsch/flexmark/parser/delimiter/DelimiterRun;)I

    move-result v7

    const/4 v8, 0x1

    if-lez v7, :cond_2

    const/4 v4, 0x1

    goto :goto_3

    .line 1858
    :cond_2
    invoke-virtual {v5}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getPrevious()Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    move-result-object v5

    goto :goto_2

    :cond_3
    move v4, v8

    const/4 v8, 0x0

    :goto_3
    if-nez v8, :cond_5

    if-nez v4, :cond_4

    .line 1870
    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getPrevious()Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1871
    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->canOpen()Z

    move-result v2

    if-nez v2, :cond_4

    .line 1874
    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->removeDelimiterKeepNode(Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)V

    .line 1877
    :cond_4
    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNext()Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    move-result-object v1

    goto :goto_1

    .line 1882
    :cond_5
    invoke-virtual {v5}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNumDelims()I

    move-result v2

    sub-int/2addr v2, v7

    invoke-virtual {v5, v2}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->setNumDelims(I)V

    .line 1883
    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNumDelims()I

    move-result v2

    sub-int/2addr v2, v7

    invoke-virtual {v1, v2}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->setNumDelims(I)V

    .line 1885
    invoke-virtual {p0, v5, v1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->removeDelimitersBetween(Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)V

    .line 1890
    invoke-virtual {v5}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNumDelims()I

    move-result v2

    add-int/2addr v2, v7

    invoke-virtual {v5, v2}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->setNumDelims(I)V

    .line 1891
    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNumDelims()I

    move-result v2

    add-int/2addr v2, v7

    invoke-virtual {v1, v2}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->setNumDelims(I)V

    .line 1893
    invoke-interface {v3, v5, v1, v7}, Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;->process(Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;I)V

    .line 1895
    invoke-virtual {v5}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNumDelims()I

    move-result v2

    sub-int/2addr v2, v7

    invoke-virtual {v5, v2}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->setNumDelims(I)V

    .line 1896
    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNumDelims()I

    move-result v2

    sub-int/2addr v2, v7

    invoke-virtual {v1, v2}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->setNumDelims(I)V

    .line 1899
    invoke-virtual {v5}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNumDelims()I

    move-result v2

    if-nez v2, :cond_6

    .line 1900
    invoke-virtual {p0, v5}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->removeDelimiterAndNode(Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)V

    goto :goto_4

    .line 1903
    :cond_6
    invoke-virtual {v5}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNode()Lcom/vladsch/flexmark/ast/Text;

    move-result-object v2

    invoke-virtual {v5}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNode()Lcom/vladsch/flexmark/ast/Text;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vladsch/flexmark/ast/Text;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    invoke-virtual {v5}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNumDelims()I

    move-result v4

    invoke-interface {v3, v6, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vladsch/flexmark/ast/Text;->setChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 1906
    :goto_4
    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNumDelims()I

    move-result v2

    if-nez v2, :cond_7

    .line 1907
    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNext()Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    move-result-object v2

    .line 1908
    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->removeDelimiterAndNode(Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)V

    move-object v1, v2

    goto/16 :goto_1

    .line 1912
    :cond_7
    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNode()Lcom/vladsch/flexmark/ast/Text;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vladsch/flexmark/ast/Text;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    .line 1913
    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v3

    .line 1914
    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNode()Lcom/vladsch/flexmark/ast/Text;

    move-result-object v4

    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNumDelims()I

    move-result v5

    sub-int v5, v3, v5

    invoke-interface {v2, v5, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-virtual {v4, v2}, Lcom/vladsch/flexmark/ast/Text;->setChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 1915
    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getIndex()I

    move-result v2

    add-int/2addr v2, v7

    invoke-virtual {v1, v2}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->setIndex(I)V

    goto/16 :goto_1

    .line 1837
    :cond_8
    :goto_5
    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNext()Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    move-result-object v1

    goto/16 :goto_1

    .line 1920
    :cond_9
    :goto_6
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->lastDelimiter:Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    if-eqz v0, :cond_a

    if-eq v0, p1, :cond_a

    .line 1921
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->removeDelimiterKeepNode(Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)V

    goto :goto_6

    :cond_a
    return-void
.end method

.method public removeDelimiter(Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)V
    .locals 2

    .line 1997
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getPrevious()Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1998
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getPrevious()Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    move-result-object v0

    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNext()Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->setNext(Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)V

    .line 2000
    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNext()Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    move-result-object v0

    if-nez v0, :cond_1

    .line 2002
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getPrevious()Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->lastDelimiter:Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    return-void

    .line 2004
    :cond_1
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNext()Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    move-result-object v0

    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getPrevious()Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->setPrevious(Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)V

    return-void
.end method

.method public removeDelimiterAndNode(Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)V
    .locals 6

    .line 1942
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNode()Lcom/vladsch/flexmark/ast/Text;

    move-result-object v0

    .line 1943
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getPreviousNonDelimiterTextNode()Lcom/vladsch/flexmark/ast/Text;

    move-result-object v1

    .line 1944
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNextNonDelimiterTextNode()Lcom/vladsch/flexmark/ast/Text;

    move-result-object v2

    if-eqz v1, :cond_0

    if-eqz v2, :cond_0

    .line 1947
    iget-object v3, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/ast/Text;->getStartOffset()I

    move-result v4

    invoke-virtual {v2}, Lcom/vladsch/flexmark/ast/Text;->getEndOffset()I

    move-result v5

    invoke-interface {v3, v4, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/vladsch/flexmark/ast/Text;->setChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 1948
    invoke-virtual {v2}, Lcom/vladsch/flexmark/ast/Text;->unlink()V

    .line 1951
    :cond_0
    invoke-virtual {v0}, Lcom/vladsch/flexmark/ast/Text;->unlink()V

    .line 1952
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->removeDelimiter(Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)V

    return-void
.end method

.method public removeDelimiterKeepNode(Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)V
    .locals 6

    .line 1963
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->delimiterProcessors:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getDelimiterChar()C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;

    if-eqz v0, :cond_0

    .line 1964
    invoke-interface {v0, p0, p1}, Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;->unmatchedDelimiterNode(Lcom/vladsch/flexmark/parser/InlineParser;Lcom/vladsch/flexmark/parser/delimiter/DelimiterRun;)Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    .line 1966
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNode()Lcom/vladsch/flexmark/ast/Text;

    move-result-object v1

    if-eq v0, v1, :cond_2

    .line 1968
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNode()Lcom/vladsch/flexmark/ast/Text;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/vladsch/flexmark/ast/Text;->insertAfter(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 1969
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNode()Lcom/vladsch/flexmark/ast/Text;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vladsch/flexmark/ast/Text;->unlink()V

    goto :goto_1

    .line 1972
    :cond_1
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNode()Lcom/vladsch/flexmark/ast/Text;

    move-result-object v0

    .line 1975
    :cond_2
    :goto_1
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getPreviousNonDelimiterTextNode()Lcom/vladsch/flexmark/ast/Text;

    move-result-object v1

    .line 1976
    invoke-virtual {p1}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getNextNonDelimiterTextNode()Lcom/vladsch/flexmark/ast/Text;

    move-result-object v2

    .line 1977
    instance-of v3, v0, Lcom/vladsch/flexmark/ast/Text;

    if-eqz v3, :cond_6

    if-nez v1, :cond_3

    if-eqz v2, :cond_6

    :cond_3
    if-eqz v2, :cond_4

    if-eqz v1, :cond_4

    .line 1980
    iget-object v3, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/ast/Text;->getStartOffset()I

    move-result v4

    invoke-virtual {v2}, Lcom/vladsch/flexmark/ast/Text;->getEndOffset()I

    move-result v5

    invoke-interface {v3, v4, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/vladsch/flexmark/util/ast/Node;->setChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 1981
    invoke-virtual {v1}, Lcom/vladsch/flexmark/ast/Text;->unlink()V

    .line 1982
    invoke-virtual {v2}, Lcom/vladsch/flexmark/ast/Text;->unlink()V

    goto :goto_2

    :cond_4
    if-eqz v1, :cond_5

    .line 1984
    iget-object v2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/ast/Text;->getStartOffset()I

    move-result v3

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getEndOffset()I

    move-result v4

    invoke-interface {v2, v3, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/vladsch/flexmark/util/ast/Node;->setChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 1985
    invoke-virtual {v1}, Lcom/vladsch/flexmark/ast/Text;->unlink()V

    goto :goto_2

    .line 1987
    :cond_5
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getStartOffset()I

    move-result v3

    invoke-virtual {v2}, Lcom/vladsch/flexmark/ast/Text;->getEndOffset()I

    move-result v4

    invoke-interface {v1, v3, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/ast/Node;->setChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 1988
    invoke-virtual {v2}, Lcom/vladsch/flexmark/ast/Text;->unlink()V

    .line 1992
    :cond_6
    :goto_2
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->removeDelimiter(Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)V

    return-void
.end method

.method public removeDelimitersBetween(Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)V
    .locals 1

    .line 1927
    invoke-virtual {p2}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getPrevious()Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    move-result-object p2

    :goto_0
    if-eqz p2, :cond_0

    if-eq p2, p1, :cond_0

    .line 1929
    invoke-virtual {p2}, Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;->getPrevious()Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;

    move-result-object v0

    .line 1930
    invoke-virtual {p0, p2}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->removeDelimiterKeepNode(Lcom/vladsch/flexmark/parser/core/delimiter/Delimiter;)V

    move-object p2, v0

    goto :goto_0

    :cond_0
    return-void
.end method

.method protected scanDelimiters(Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;C)Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$DelimiterData;
    .locals 18

    move-object/from16 v0, p0

    move/from16 v1, p2

    .line 1762
    iget v2, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 1765
    :goto_0
    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->peek()C

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v1, :cond_0

    add-int/lit8 v4, v4, 0x1

    .line 1767
    iget v5, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    add-int/2addr v5, v6

    iput v5, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    goto :goto_0

    .line 1770
    :cond_0
    invoke-interface/range {p1 .. p1}, Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;->getMinLength()I

    move-result v5

    const/4 v7, 0x0

    if-ge v4, v5, :cond_1

    .line 1771
    iput v2, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    return-object v7

    .line 1775
    :cond_1
    const-string v5, "\n"

    if-nez v2, :cond_2

    move-object v10, v5

    goto :goto_1

    :cond_2
    iget-object v8, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->input:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    add-int/lit8 v9, v2, -0x1

    invoke-interface {v8, v9}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v8

    move-object v10, v8

    .line 1777
    :goto_1
    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->peek()C

    move-result v8

    if-nez v8, :cond_3

    goto :goto_2

    .line 1778
    :cond_3
    invoke-static {v8}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v5

    :goto_2
    move-object v11, v5

    .line 1785
    iget-object v5, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    iget-object v5, v5, Lcom/vladsch/flexmark/ast/util/Parsing;->UNICODE_WHITESPACE_CHAR:Ljava/util/regex/Pattern;

    invoke-virtual {v5, v10}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/regex/Matcher;->matches()Z

    move-result v16

    .line 1786
    iget-object v5, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    iget-object v5, v5, Lcom/vladsch/flexmark/ast/util/Parsing;->UNICODE_WHITESPACE_CHAR:Ljava/util/regex/Pattern;

    invoke-virtual {v5, v11}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/regex/Matcher;->matches()Z

    move-result v17

    .line 1788
    iget-object v5, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->options:Lcom/vladsch/flexmark/parser/InlineParserOptions;

    iget-boolean v5, v5, Lcom/vladsch/flexmark/parser/InlineParserOptions;->inlineDelimiterDirectionalPunctuations:Z

    if-eqz v5, :cond_6

    .line 1789
    iget-object v5, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    iget-object v5, v5, Lcom/vladsch/flexmark/ast/util/Parsing;->PUNCTUATION_OPEN:Ljava/util/regex/Pattern;

    invoke-virtual {v5, v10}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/regex/Matcher;->matches()Z

    move-result v5

    .line 1790
    iget-object v8, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    iget-object v8, v8, Lcom/vladsch/flexmark/ast/util/Parsing;->PUNCTUATION_CLOSE:Ljava/util/regex/Pattern;

    invoke-virtual {v8, v11}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/regex/Matcher;->matches()Z

    move-result v8

    if-nez v17, :cond_5

    if-eqz v8, :cond_4

    if-nez v16, :cond_4

    if-eqz v5, :cond_5

    :cond_4
    const/4 v9, 0x1

    goto :goto_3

    :cond_5
    const/4 v9, 0x0

    :goto_3
    if-nez v16, :cond_a

    if-eqz v5, :cond_9

    if-nez v17, :cond_9

    if-eqz v8, :cond_a

    goto :goto_5

    .line 1797
    :cond_6
    iget-object v5, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    iget-object v5, v5, Lcom/vladsch/flexmark/ast/util/Parsing;->PUNCTUATION:Ljava/util/regex/Pattern;

    invoke-virtual {v5, v10}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/regex/Matcher;->matches()Z

    move-result v5

    .line 1798
    iget-object v8, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    iget-object v8, v8, Lcom/vladsch/flexmark/ast/util/Parsing;->PUNCTUATION:Ljava/util/regex/Pattern;

    invoke-virtual {v8, v11}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/regex/Matcher;->matches()Z

    move-result v8

    if-nez v17, :cond_8

    if-eqz v8, :cond_7

    if-nez v16, :cond_7

    if-eqz v5, :cond_8

    :cond_7
    const/4 v9, 0x1

    goto :goto_4

    :cond_8
    const/4 v9, 0x0

    :goto_4
    if-nez v16, :cond_a

    if-eqz v5, :cond_9

    if-nez v17, :cond_9

    if-eqz v8, :cond_a

    :cond_9
    :goto_5
    const/4 v12, 0x1

    goto :goto_6

    :cond_a
    const/4 v12, 0x0

    :goto_6
    move v14, v5

    move v15, v8

    move v13, v12

    move v12, v9

    .line 1809
    invoke-interface/range {p1 .. p1}, Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;->getOpeningCharacter()C

    move-result v5

    if-ne v1, v5, :cond_b

    move-object/from16 v9, p1

    invoke-interface/range {v9 .. v17}, Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;->canBeOpener(Ljava/lang/String;Ljava/lang/String;ZZZZZZ)Z

    move-result v5

    if-eqz v5, :cond_b

    const/4 v5, 0x1

    goto :goto_7

    :cond_b
    const/4 v5, 0x0

    .line 1810
    :goto_7
    invoke-interface/range {p1 .. p1}, Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;->getClosingCharacter()C

    move-result v8

    if-ne v1, v8, :cond_c

    move-object/from16 v9, p1

    invoke-interface/range {v9 .. v17}, Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;->canBeCloser(Ljava/lang/String;Ljava/lang/String;ZZZZZZ)Z

    move-result v1

    if-eqz v1, :cond_c

    const/4 v3, 0x1

    .line 1812
    :cond_c
    iput v2, v0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    if-nez v5, :cond_e

    if-nez v3, :cond_e

    .line 1814
    invoke-interface/range {p1 .. p1}, Lcom/vladsch/flexmark/parser/delimiter/DelimiterProcessor;->skipNonOpenerCloser()Z

    move-result v1

    if-nez v1, :cond_d

    goto :goto_8

    :cond_d
    return-object v7

    .line 1815
    :cond_e
    :goto_8
    new-instance v1, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$DelimiterData;

    invoke-direct {v1, v4, v5, v3}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$DelimiterData;-><init>(IZZ)V

    return-object v1
.end method

.method public setIndex(I)V
    .locals 0

    .line 339
    iput p1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->index:I

    return-void
.end method

.method public sp()Z
    .locals 1

    .line 895
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    iget-object v0, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->SP:Ljava/util/regex/Pattern;

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->match(Ljava/util/regex/Pattern;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v0, 0x1

    return v0
.end method

.method public spnl()Z
    .locals 1

    .line 873
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    iget-object v0, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->SPNL:Ljava/util/regex/Pattern;

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->match(Ljava/util/regex/Pattern;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    const/4 v0, 0x1

    return v0
.end method

.method public spnlUrl()Z
    .locals 1

    .line 906
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    iget-object v0, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->SPNL_URL:Ljava/util/regex/Pattern;

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->match(Ljava/util/regex/Pattern;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public toEOL()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 1

    .line 916
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->myParsing:Lcom/vladsch/flexmark/ast/util/Parsing;

    iget-object v0, v0, Lcom/vladsch/flexmark/ast/util/Parsing;->REST_OF_LINE:Ljava/util/regex/Pattern;

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->match(Ljava/util/regex/Pattern;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    return-object v0
.end method
