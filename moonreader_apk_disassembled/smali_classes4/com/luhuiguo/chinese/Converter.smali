.class public final enum Lcom/luhuiguo/chinese/Converter;
.super Ljava/lang/Enum;
.source "Converter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/luhuiguo/chinese/Converter;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/luhuiguo/chinese/Converter;

.field public static final CJK_UNIFIED_IDEOGRAPHS_END:C = '\u9fa5'

.field public static final CJK_UNIFIED_IDEOGRAPHS_START:C = '\u4e00'

.field public static final EMPTY:Ljava/lang/String; = ""

.field public static final EQUAL:Ljava/lang/String; = "="

.field public static final SHARP:Ljava/lang/String; = "#"

.field public static final enum SIMPLIFIED:Lcom/luhuiguo/chinese/Converter;

.field public static final SIMPLIFIED_LEXEMIC_MAPPING_FILE:Ljava/lang/String; = "/simplified.txt"

.field public static final SIMPLIFIED_MAPPING_FILE:Ljava/lang/String; = "/simp.txt"

.field public static final enum TRADITIONAL:Lcom/luhuiguo/chinese/Converter;

.field public static final TRADITIONAL_LEXEMIC_MAPPING_FILE:Ljava/lang/String; = "/traditional.txt"

.field public static final TRADITIONAL_MAPPING_FILE:Ljava/lang/String; = "/trad.txt"


# instance fields
.field private chars:[C

.field private dict:Lcom/luhuiguo/chinese/Trie;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/luhuiguo/chinese/Trie<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private maxLen:I


# direct methods
.method private static synthetic $values()[Lcom/luhuiguo/chinese/Converter;
    .locals 3

    const/4 v0, 0x2

    .line 26
    new-array v0, v0, [Lcom/luhuiguo/chinese/Converter;

    sget-object v1, Lcom/luhuiguo/chinese/Converter;->SIMPLIFIED:Lcom/luhuiguo/chinese/Converter;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/luhuiguo/chinese/Converter;->TRADITIONAL:Lcom/luhuiguo/chinese/Converter;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 27
    new-instance v0, Lcom/luhuiguo/chinese/Converter;

    const-string v1, "SIMPLIFIED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/luhuiguo/chinese/Converter;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/luhuiguo/chinese/Converter;->SIMPLIFIED:Lcom/luhuiguo/chinese/Converter;

    new-instance v0, Lcom/luhuiguo/chinese/Converter;

    const-string v1, "TRADITIONAL"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, v2}, Lcom/luhuiguo/chinese/Converter;-><init>(Ljava/lang/String;IZ)V

    sput-object v0, Lcom/luhuiguo/chinese/Converter;->TRADITIONAL:Lcom/luhuiguo/chinese/Converter;

    .line 26
    invoke-static {}, Lcom/luhuiguo/chinese/Converter;->$values()[Lcom/luhuiguo/chinese/Converter;

    move-result-object v0

    sput-object v0, Lcom/luhuiguo/chinese/Converter;->$VALUES:[Lcom/luhuiguo/chinese/Converter;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IZ)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000,
            0x0
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)V"
        }
    .end annotation

    .line 46
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    const/4 p1, 0x0

    .line 40
    iput-object p1, p0, Lcom/luhuiguo/chinese/Converter;->chars:[C

    .line 42
    iput-object p1, p0, Lcom/luhuiguo/chinese/Converter;->dict:Lcom/luhuiguo/chinese/Trie;

    const/4 p1, 0x2

    .line 44
    iput p1, p0, Lcom/luhuiguo/chinese/Converter;->maxLen:I

    .line 47
    invoke-virtual {p0, p3}, Lcom/luhuiguo/chinese/Converter;->loadCharMapping(Z)V

    .line 48
    invoke-virtual {p0, p3}, Lcom/luhuiguo/chinese/Converter;->loadLexemicMapping(Z)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/luhuiguo/chinese/Converter;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 26
    const-class v0, Lcom/luhuiguo/chinese/Converter;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/luhuiguo/chinese/Converter;

    return-object p0
.end method

.method public static values()[Lcom/luhuiguo/chinese/Converter;
    .locals 1

    .line 26
    sget-object v0, Lcom/luhuiguo/chinese/Converter;->$VALUES:[Lcom/luhuiguo/chinese/Converter;

    invoke-virtual {v0}, [Lcom/luhuiguo/chinese/Converter;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/luhuiguo/chinese/Converter;

    return-object v0
.end method


# virtual methods
.method public convert(C)C
    .locals 2

    const/16 v0, 0x4e00

    if-lt p1, v0, :cond_0

    const v1, 0x9fa5

    if-gt p1, v1, :cond_0

    .line 125
    iget-object v1, p0, Lcom/luhuiguo/chinese/Converter;->chars:[C

    sub-int/2addr p1, v0

    aget-char p1, v1, p1

    :cond_0
    return p1
.end method

.method public convert(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 159
    new-instance v0, Ljava/io/StringReader;

    invoke-direct {v0, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    .line 160
    new-instance p1, Ljava/io/StringWriter;

    invoke-direct {p1}, Ljava/io/StringWriter;-><init>()V

    .line 162
    :try_start_0
    invoke-virtual {p0, v0, p1}, Lcom/luhuiguo/chinese/Converter;->convert(Ljava/io/Reader;Ljava/io/Writer;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 164
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 166
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public convert(Ljava/io/Reader;Ljava/io/Writer;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 133
    new-instance v0, Ljava/io/PushbackReader;

    new-instance v1, Ljava/io/BufferedReader;

    invoke-direct {v1, p1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    iget p1, p0, Lcom/luhuiguo/chinese/Converter;->maxLen:I

    invoke-direct {v0, v1, p1}, Ljava/io/PushbackReader;-><init>(Ljava/io/Reader;I)V

    .line 136
    iget p1, p0, Lcom/luhuiguo/chinese/Converter;->maxLen:I

    new-array p1, p1, [C

    .line 139
    :goto_0
    invoke-virtual {v0, p1}, Ljava/io/PushbackReader;->read([C)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 140
    iget-object v2, p0, Lcom/luhuiguo/chinese/Converter;->dict:Lcom/luhuiguo/chinese/Trie;

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v3, v1}, Lcom/luhuiguo/chinese/Trie;->bestMatch([CII)Lcom/luhuiguo/chinese/TrieNode;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 143
    invoke-virtual {v2}, Lcom/luhuiguo/chinese/TrieNode;->getLevel()I

    move-result v3

    .line 144
    invoke-virtual {v2}, Lcom/luhuiguo/chinese/TrieNode;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p2, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    sub-int/2addr v1, v3

    .line 145
    invoke-virtual {v0, p1, v3, v1}, Ljava/io/PushbackReader;->unread([CII)V

    goto :goto_0

    .line 147
    :cond_0
    invoke-virtual {v0, p1, v3, v1}, Ljava/io/PushbackReader;->unread([CII)V

    .line 148
    invoke-virtual {v0}, Ljava/io/PushbackReader;->read()I

    move-result v1

    int-to-char v1, v1

    .line 149
    invoke-virtual {p0, v1}, Lcom/luhuiguo/chinese/Converter;->convert(C)C

    move-result v1

    invoke-virtual {p2, v1}, Ljava/io/Writer;->write(I)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public loadCharMapping(Z)V
    .locals 4

    if-eqz p1, :cond_0

    .line 56
    const-string p1, "/trad.txt"

    goto :goto_0

    .line 55
    :cond_0
    const-string p1, "/simp.txt"

    .line 60
    :goto_0
    :try_start_0
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    new-instance v2, Ljava/io/BufferedInputStream;

    .line 61
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    invoke-direct {v2, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    sget-object p1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v1, v2, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 64
    new-instance p1, Ljava/io/CharArrayWriter;

    invoke-direct {p1}, Ljava/io/CharArrayWriter;-><init>()V

    .line 66
    :goto_1
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 68
    invoke-virtual {p1, v1}, Ljava/io/CharArrayWriter;->write(Ljava/lang/String;)V

    goto :goto_1

    .line 70
    :cond_1
    invoke-virtual {p1}, Ljava/io/CharArrayWriter;->toCharArray()[C

    move-result-object p1

    iput-object p1, p0, Lcom/luhuiguo/chinese/Converter;->chars:[C

    .line 71
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    .line 74
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    return-void
.end method

.method public loadLexemicMapping(Z)V
    .locals 4

    .line 79
    new-instance v0, Lcom/luhuiguo/chinese/Trie;

    invoke-direct {v0}, Lcom/luhuiguo/chinese/Trie;-><init>()V

    iput-object v0, p0, Lcom/luhuiguo/chinese/Converter;->dict:Lcom/luhuiguo/chinese/Trie;

    if-eqz p1, :cond_0

    .line 81
    sget-boolean v0, Lcom/flyersoft/tools/A;->jianFanWord:Z

    if-nez v0, :cond_0

    goto/16 :goto_3

    :cond_0
    if-nez p1, :cond_1

    .line 83
    sget-boolean v0, Lcom/flyersoft/tools/A;->fanjianWord:Z

    if-nez v0, :cond_1

    goto :goto_3

    :cond_1
    if-eqz p1, :cond_2

    .line 89
    const-string p1, "/traditional.txt"

    goto :goto_0

    .line 88
    :cond_2
    const-string p1, "/simplified.txt"

    .line 94
    :goto_0
    :try_start_0
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    new-instance v2, Ljava/io/BufferedInputStream;

    .line 95
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    invoke-direct {v2, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    sget-object p1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v1, v2, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 99
    :cond_3
    :goto_1
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_7

    .line 101
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_3

    const-string v1, "#"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    goto :goto_1

    .line 104
    :cond_4
    const-string v1, "="

    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 106
    array-length v1, p1

    const/4 v2, 0x2

    if-ge v1, v2, :cond_5

    goto :goto_1

    .line 109
    :cond_5
    iget v1, p0, Lcom/luhuiguo/chinese/Converter;->maxLen:I

    const/4 v2, 0x0

    aget-object v3, p1, v2

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_6

    aget-object v1, p1, v2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    goto :goto_2

    :cond_6
    iget v1, p0, Lcom/luhuiguo/chinese/Converter;->maxLen:I

    :goto_2
    iput v1, p0, Lcom/luhuiguo/chinese/Converter;->maxLen:I

    .line 110
    iget-object v1, p0, Lcom/luhuiguo/chinese/Converter;->dict:Lcom/luhuiguo/chinese/Trie;

    aget-object v2, p1, v2

    const/4 v3, 0x1

    aget-object p1, p1, v3

    invoke-virtual {v1, v2, p1}, Lcom/luhuiguo/chinese/Trie;->add(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    .line 113
    :cond_7
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 116
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    :goto_3
    return-void
.end method
