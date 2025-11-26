.class public Lcom/vladsch/flexmark/util/html/Html5Entities;
.super Ljava/lang/Object;
.source "Html5Entities.java"


# static fields
.field private static final ENTITY_PATH:Ljava/lang/String; = "/com/vladsch/flexmark/util/html/entities.properties"

.field private static final NAMED_CHARACTER_REFERENCES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final NUMERIC_PATTERN:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 19
    invoke-static {}, Lcom/vladsch/flexmark/util/html/Html5Entities;->readEntities()Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/vladsch/flexmark/util/html/Html5Entities;->NAMED_CHARACTER_REFERENCES:Ljava/util/Map;

    .line 20
    const-string v0, "^&#[Xx]?"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vladsch/flexmark/util/html/Html5Entities;->NUMERIC_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static entityToSequence(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
    .locals 6

    .line 49
    const-string v0, "\ufffd"

    sget-object v1, Lcom/vladsch/flexmark/util/html/Html5Entities;->NUMERIC_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    const/4 v2, 0x0

    .line 50
    invoke-interface {p0, v2, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    .line 52
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_2

    .line 53
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->end()I

    move-result v3

    const/4 v5, 0x2

    if-ne v3, v5, :cond_0

    const/16 v3, 0xa

    goto :goto_0

    :cond_0
    const/16 v3, 0x10

    .line 55
    :goto_0
    :try_start_0
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->end()I

    move-result v1

    invoke-interface {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v5

    sub-int/2addr v5, v4

    invoke-interface {p0, v1, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result p0

    if-nez p0, :cond_1

    .line 57
    invoke-static {v0, v2}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->of(Ljava/lang/String;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;

    move-result-object p0

    return-object p0

    .line 59
    :cond_1
    invoke-static {p0}, Ljava/lang/Character;->toChars(I)[C

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->toString([C)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v2}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->of(Ljava/lang/String;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 61
    :catch_0
    invoke-static {v0, v2}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->of(Ljava/lang/String;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;

    move-result-object p0

    return-object p0

    .line 64
    :cond_2
    invoke-interface {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    sub-int/2addr v0, v4

    invoke-interface {p0, v4, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 65
    sget-object v1, Lcom/vladsch/flexmark/util/html/Html5Entities;->NAMED_CHARACTER_REFERENCES:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_3

    .line 67
    invoke-static {v0, v2}, Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;->of(Ljava/lang/String;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/PrefixedSubSequence;

    move-result-object p0

    :cond_3
    return-object p0
.end method

.method public static entityToString(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 24
    const-string v0, "\ufffd"

    sget-object v1, Lcom/vladsch/flexmark/util/html/Html5Entities;->NUMERIC_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 26
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    .line 27
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->end()I

    move-result v2

    const/4 v4, 0x2

    if-ne v2, v4, :cond_0

    const/16 v2, 0xa

    goto :goto_0

    :cond_0
    const/16 v2, 0x10

    .line 29
    :goto_0
    :try_start_0
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->end()I

    move-result v1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v4, v3

    invoke-virtual {p0, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result p0

    if-nez p0, :cond_1

    return-object v0

    .line 33
    :cond_1
    new-instance v1, Ljava/lang/String;

    invoke-static {p0}, Ljava/lang/Character;->toChars(I)[C

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/lang/String;-><init>([C)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    return-object v0

    .line 38
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v3

    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 39
    sget-object v1, Lcom/vladsch/flexmark/util/html/Html5Entities;->NAMED_CHARACTER_REFERENCES:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_3

    return-object v0

    :cond_3
    return-object p0
.end method

.method private static readEntities()Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 75
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 76
    const-class v1, Lcom/vladsch/flexmark/util/html/Html5Entities;

    const-string v2, "/com/vladsch/flexmark/util/html/entities.properties"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 77
    const-string v2, "UTF-8"

    invoke-static {v2}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v2

    .line 80
    :try_start_0
    new-instance v3, Ljava/io/InputStreamReader;

    invoke-direct {v3, v1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    .line 81
    new-instance v1, Ljava/io/BufferedReader;

    invoke-direct {v1, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 83
    :goto_0
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 84
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_0

    goto :goto_0

    .line 87
    :cond_0
    const-string v3, "="

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    const/4 v4, 0x0

    .line 88
    invoke-virtual {v2, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    .line 89
    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 90
    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 95
    :cond_1
    const-string v1, "NewLine"

    const-string v2, "\n"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0

    :catch_0
    move-exception v0

    .line 93
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Failed reading data for HTML named character references"

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method
