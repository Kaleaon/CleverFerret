.class public Lorg/ccil/cowan/tagsoup/CommandLine;
.super Ljava/lang/Object;
.source "CommandLine.java"


# static fields
.field static options:Ljava/util/Hashtable;

.field private static theOutputEncoding:Ljava/lang/String;

.field private static theParser:Lorg/ccil/cowan/tagsoup/Parser;

.field private static theSchema:Lorg/ccil/cowan/tagsoup/HTMLSchema;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 33
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    sput-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    .line 34
    const-string v1, "--nocdata"

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    sget-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v1, "--files"

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    sget-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v1, "--reuse"

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    sget-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v1, "--nons"

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    sget-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v1, "--nobogons"

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    sget-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v1, "--any"

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    sget-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v1, "--emptybogons"

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    sget-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v1, "--norootbogons"

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    sget-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v1, "--pyxin"

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    sget-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v1, "--lexical"

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    sget-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v1, "--pyx"

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    sget-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v1, "--html"

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    sget-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v1, "--method="

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    sget-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v1, "--doctype-public="

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    sget-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v1, "--doctype-system="

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    sget-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v1, "--output-encoding="

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    sget-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v1, "--omit-xml-declaration"

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    sget-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v1, "--encoding="

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    sget-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v1, "--help"

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    sget-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v1, "--version"

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    sget-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v1, "--nodefaults"

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    sget-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v1, "--nocolons"

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    sget-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v1, "--norestart"

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    sget-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v1, "--ignorable"

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x0

    .line 121
    sput-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->theParser:Lorg/ccil/cowan/tagsoup/Parser;

    .line 122
    sput-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->theSchema:Lorg/ccil/cowan/tagsoup/HTMLSchema;

    .line 123
    sput-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->theOutputEncoding:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static chooseContentHandler(Ljava/io/Writer;)Lorg/xml/sax/ContentHandler;
    .locals 5

    .line 213
    sget-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v1, "--pyx"

    invoke-static {v0, v1}, Lorg/ccil/cowan/tagsoup/CommandLine;->hasOption(Ljava/util/Hashtable;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 214
    new-instance v0, Lorg/ccil/cowan/tagsoup/PYXWriter;

    invoke-direct {v0, p0}, Lorg/ccil/cowan/tagsoup/PYXWriter;-><init>(Ljava/io/Writer;)V

    return-object v0

    .line 217
    :cond_0
    new-instance v0, Lorg/ccil/cowan/tagsoup/XMLWriter;

    invoke-direct {v0, p0}, Lorg/ccil/cowan/tagsoup/XMLWriter;-><init>(Ljava/io/Writer;)V

    .line 218
    sget-object p0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v1, "--html"

    invoke-static {p0, v1}, Lorg/ccil/cowan/tagsoup/CommandLine;->hasOption(Ljava/util/Hashtable;Ljava/lang/String;)Z

    move-result p0

    const-string v1, "yes"

    const-string v2, "omit-xml-declaration"

    const-string v3, "method"

    if-eqz p0, :cond_1

    .line 219
    const-string p0, "html"

    invoke-virtual {v0, v3, p0}, Lorg/ccil/cowan/tagsoup/XMLWriter;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    invoke-virtual {v0, v2, v1}, Lorg/ccil/cowan/tagsoup/XMLWriter;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 222
    :cond_1
    sget-object p0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v4, "--method="

    invoke-static {p0, v4}, Lorg/ccil/cowan/tagsoup/CommandLine;->hasOption(Ljava/util/Hashtable;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_2

    .line 223
    sget-object p0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    invoke-virtual {p0, v4}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_2

    .line 225
    invoke-virtual {v0, v3, p0}, Lorg/ccil/cowan/tagsoup/XMLWriter;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 228
    :cond_2
    sget-object p0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v3, "--doctype-public="

    invoke-static {p0, v3}, Lorg/ccil/cowan/tagsoup/CommandLine;->hasOption(Ljava/util/Hashtable;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_3

    .line 229
    sget-object p0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    invoke-virtual {p0, v3}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_3

    .line 231
    const-string v3, "doctype-public"

    invoke-virtual {v0, v3, p0}, Lorg/ccil/cowan/tagsoup/XMLWriter;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 234
    :cond_3
    sget-object p0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v3, "--doctype-system="

    invoke-static {p0, v3}, Lorg/ccil/cowan/tagsoup/CommandLine;->hasOption(Ljava/util/Hashtable;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_4

    .line 235
    sget-object p0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    invoke-virtual {p0, v3}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_4

    .line 237
    const-string v3, "doctype-system"

    invoke-virtual {v0, v3, p0}, Lorg/ccil/cowan/tagsoup/XMLWriter;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    :cond_4
    sget-object p0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v3, "--output-encoding="

    invoke-static {p0, v3}, Lorg/ccil/cowan/tagsoup/CommandLine;->hasOption(Ljava/util/Hashtable;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_5

    .line 241
    sget-object p0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    invoke-virtual {p0, v3}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    sput-object p0, Lorg/ccil/cowan/tagsoup/CommandLine;->theOutputEncoding:Ljava/lang/String;

    if-eqz p0, :cond_5

    .line 244
    const-string v3, "encoding"

    invoke-virtual {v0, v3, p0}, Lorg/ccil/cowan/tagsoup/XMLWriter;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 247
    :cond_5
    sget-object p0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v3, "--omit-xml-declaration"

    invoke-static {p0, v3}, Lorg/ccil/cowan/tagsoup/CommandLine;->hasOption(Ljava/util/Hashtable;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_6

    .line 248
    invoke-virtual {v0, v2, v1}, Lorg/ccil/cowan/tagsoup/XMLWriter;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 250
    :cond_6
    sget-object p0, Lorg/ccil/cowan/tagsoup/CommandLine;->theSchema:Lorg/ccil/cowan/tagsoup/HTMLSchema;

    invoke-virtual {p0}, Lorg/ccil/cowan/tagsoup/HTMLSchema;->getURI()Ljava/lang/String;

    move-result-object p0

    const-string v1, ""

    invoke-virtual {v0, p0, v1}, Lorg/ccil/cowan/tagsoup/XMLWriter;->setPrefix(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method private static doHelp()V
    .locals 3

    .line 104
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "usage: java -jar tagsoup-*.jar "

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 105
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, " [ "

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 107
    sget-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v0

    const/4 v1, 0x1

    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-nez v2, :cond_0

    .line 118
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "]*"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void

    :cond_0
    if-nez v1, :cond_1

    .line 109
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v2, "| "

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 112
    :cond_1
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 113
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v2, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 114
    const-string v2, "="

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 115
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v2, "?"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 116
    :cond_2
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static getopts(Ljava/util/Hashtable;[Ljava/lang/String;)I
    .locals 5

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 258
    :goto_0
    array-length v2, p1

    if-lt v1, v2, :cond_0

    goto :goto_1

    .line 259
    :cond_0
    aget-object v2, p1, v1

    .line 261
    invoke-virtual {v2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x2d

    if-eq v3, v4, :cond_1

    :goto_1
    return v1

    :cond_1
    const/16 v3, 0x3d

    .line 262
    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_2

    add-int/lit8 v3, v3, 0x1

    .line 264
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 265
    invoke-virtual {v2, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_2

    :cond_2
    const/4 v4, 0x0

    .line 267
    :goto_2
    invoke-virtual {p0, v2}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    if-nez v4, :cond_3

    .line 268
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, v2, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 269
    :cond_3
    invoke-virtual {p0, v2, v4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 273
    :cond_4
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v4, "Unknown option "

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 274
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v3, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    const/4 v2, 0x1

    .line 275
    invoke-static {v2}, Ljava/lang/System;->exit(I)V

    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private static hasOption(Ljava/util/Hashtable;Ljava/lang/String;)Z
    .locals 2

    .line 284
    invoke-static {p1}, Ljava/lang/Boolean;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 285
    :cond_0
    invoke-virtual {p0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    if-eq p0, p1, :cond_1

    return v1

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public static main([Ljava/lang/String;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 65
    sget-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    invoke-static {v0, p0}, Lorg/ccil/cowan/tagsoup/CommandLine;->getopts(Ljava/util/Hashtable;[Ljava/lang/String;)I

    move-result v0

    .line 66
    sget-object v1, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v2, "--help"

    invoke-static {v1, v2}, Lorg/ccil/cowan/tagsoup/CommandLine;->hasOption(Ljava/util/Hashtable;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 67
    invoke-static {}, Lorg/ccil/cowan/tagsoup/CommandLine;->doHelp()V

    return-void

    .line 70
    :cond_0
    sget-object v1, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v2, "--version"

    invoke-static {v1, v2}, Lorg/ccil/cowan/tagsoup/CommandLine;->hasOption(Ljava/util/Hashtable;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 71
    sget-object p0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v0, "TagSoup version 1.2"

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void

    .line 74
    :cond_1
    array-length v1, p0

    if-ne v1, v0, :cond_2

    .line 75
    const-string p0, ""

    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0, v0}, Lorg/ccil/cowan/tagsoup/CommandLine;->process(Ljava/lang/String;Ljava/io/OutputStream;)V

    return-void

    .line 77
    :cond_2
    sget-object v1, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v2, "--files"

    invoke-static {v1, v2}, Lorg/ccil/cowan/tagsoup/CommandLine;->hasOption(Ljava/util/Hashtable;Ljava/lang/String;)Z

    move-result v1

    const-string v2, "src: "

    if-eqz v1, :cond_6

    .line 78
    :goto_0
    array-length v1, p0

    if-lt v0, v1, :cond_3

    goto :goto_3

    .line 79
    :cond_3
    aget-object v1, p0, v0

    const/16 v3, 0x2e

    .line 81
    invoke-virtual {v1, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v3

    const/4 v4, -0x1

    .line 82
    const-string v5, ".xhtml"

    if-ne v3, v4, :cond_4

    .line 83
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 84
    :cond_4
    invoke-virtual {v1, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 85
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 87
    :cond_5
    new-instance v4, Ljava/lang/StringBuilder;

    const/4 v6, 0x0

    invoke-virtual {v1, v6, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 88
    :goto_1
    sget-object v4, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " dst: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 89
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 90
    invoke-static {v1, v4}, Lorg/ccil/cowan/tagsoup/CommandLine;->process(Ljava/lang/String;Ljava/io/OutputStream;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 94
    :cond_6
    :goto_2
    array-length v1, p0

    if-lt v0, v1, :cond_7

    :goto_3
    return-void

    .line 95
    :cond_7
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-object v4, p0, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 96
    aget-object v1, p0, v0

    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {v1, v3}, Lorg/ccil/cowan/tagsoup/CommandLine;->process(Ljava/lang/String;Ljava/io/OutputStream;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method

.method private static process(Ljava/lang/String;Ljava/io/OutputStream;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 130
    sget-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v1, "--reuse"

    invoke-static {v0, v1}, Lorg/ccil/cowan/tagsoup/CommandLine;->hasOption(Ljava/util/Hashtable;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 131
    sget-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->theParser:Lorg/ccil/cowan/tagsoup/Parser;

    if-nez v0, :cond_0

    new-instance v0, Lorg/ccil/cowan/tagsoup/Parser;

    invoke-direct {v0}, Lorg/ccil/cowan/tagsoup/Parser;-><init>()V

    sput-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->theParser:Lorg/ccil/cowan/tagsoup/Parser;

    .line 132
    :cond_0
    sget-object v0, Lorg/ccil/cowan/tagsoup/CommandLine;->theParser:Lorg/ccil/cowan/tagsoup/Parser;

    goto :goto_0

    .line 135
    :cond_1
    new-instance v0, Lorg/ccil/cowan/tagsoup/Parser;

    invoke-direct {v0}, Lorg/ccil/cowan/tagsoup/Parser;-><init>()V

    .line 137
    :goto_0
    new-instance v1, Lorg/ccil/cowan/tagsoup/HTMLSchema;

    invoke-direct {v1}, Lorg/ccil/cowan/tagsoup/HTMLSchema;-><init>()V

    sput-object v1, Lorg/ccil/cowan/tagsoup/CommandLine;->theSchema:Lorg/ccil/cowan/tagsoup/HTMLSchema;

    .line 138
    const-string v2, "http://www.ccil.org/~cowan/tagsoup/properties/schema"

    invoke-interface {v0, v2, v1}, Lorg/xml/sax/XMLReader;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 140
    sget-object v1, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v2, "--nocdata"

    invoke-static {v1, v2}, Lorg/ccil/cowan/tagsoup/CommandLine;->hasOption(Ljava/util/Hashtable;Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 141
    const-string v1, "http://www.ccil.org/~cowan/tagsoup/features/cdata-elements"

    invoke-interface {v0, v1, v2}, Lorg/xml/sax/XMLReader;->setFeature(Ljava/lang/String;Z)V

    .line 144
    :cond_2
    sget-object v1, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v3, "--nons"

    invoke-static {v1, v3}, Lorg/ccil/cowan/tagsoup/CommandLine;->hasOption(Ljava/util/Hashtable;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3

    sget-object v1, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v3, "--html"

    invoke-static {v1, v3}, Lorg/ccil/cowan/tagsoup/CommandLine;->hasOption(Ljava/util/Hashtable;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 145
    :cond_3
    const-string v1, "http://xml.org/sax/features/namespaces"

    invoke-interface {v0, v1, v2}, Lorg/xml/sax/XMLReader;->setFeature(Ljava/lang/String;Z)V

    .line 148
    :cond_4
    sget-object v1, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v3, "--nobogons"

    invoke-static {v1, v3}, Lorg/ccil/cowan/tagsoup/CommandLine;->hasOption(Ljava/util/Hashtable;Ljava/lang/String;)Z

    move-result v1

    const/4 v3, 0x1

    if-eqz v1, :cond_5

    .line 149
    const-string v1, "http://www.ccil.org/~cowan/tagsoup/features/ignore-bogons"

    invoke-interface {v0, v1, v3}, Lorg/xml/sax/XMLReader;->setFeature(Ljava/lang/String;Z)V

    .line 152
    :cond_5
    sget-object v1, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v4, "--any"

    invoke-static {v1, v4}, Lorg/ccil/cowan/tagsoup/CommandLine;->hasOption(Ljava/util/Hashtable;Ljava/lang/String;)Z

    move-result v1

    const-string v4, "http://www.ccil.org/~cowan/tagsoup/features/bogons-empty"

    if-eqz v1, :cond_6

    .line 153
    invoke-interface {v0, v4, v2}, Lorg/xml/sax/XMLReader;->setFeature(Ljava/lang/String;Z)V

    goto :goto_1

    .line 155
    :cond_6
    sget-object v1, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v5, "--emptybogons"

    invoke-static {v1, v5}, Lorg/ccil/cowan/tagsoup/CommandLine;->hasOption(Ljava/util/Hashtable;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 156
    invoke-interface {v0, v4, v3}, Lorg/xml/sax/XMLReader;->setFeature(Ljava/lang/String;Z)V

    .line 159
    :cond_7
    :goto_1
    sget-object v1, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v4, "--norootbogons"

    invoke-static {v1, v4}, Lorg/ccil/cowan/tagsoup/CommandLine;->hasOption(Ljava/util/Hashtable;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 160
    const-string v1, "http://www.ccil.org/~cowan/tagsoup/features/root-bogons"

    invoke-interface {v0, v1, v2}, Lorg/xml/sax/XMLReader;->setFeature(Ljava/lang/String;Z)V

    .line 163
    :cond_8
    sget-object v1, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v4, "--nodefaults"

    invoke-static {v1, v4}, Lorg/ccil/cowan/tagsoup/CommandLine;->hasOption(Ljava/util/Hashtable;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 164
    const-string v1, "http://www.ccil.org/~cowan/tagsoup/features/default-attributes"

    invoke-interface {v0, v1, v2}, Lorg/xml/sax/XMLReader;->setFeature(Ljava/lang/String;Z)V

    .line 166
    :cond_9
    sget-object v1, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v4, "--nocolons"

    invoke-static {v1, v4}, Lorg/ccil/cowan/tagsoup/CommandLine;->hasOption(Ljava/util/Hashtable;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 167
    const-string v1, "http://www.ccil.org/~cowan/tagsoup/features/translate-colons"

    invoke-interface {v0, v1, v3}, Lorg/xml/sax/XMLReader;->setFeature(Ljava/lang/String;Z)V

    .line 170
    :cond_a
    sget-object v1, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v4, "--norestart"

    invoke-static {v1, v4}, Lorg/ccil/cowan/tagsoup/CommandLine;->hasOption(Ljava/util/Hashtable;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 171
    const-string v1, "http://www.ccil.org/~cowan/tagsoup/features/restart-elements"

    invoke-interface {v0, v1, v2}, Lorg/xml/sax/XMLReader;->setFeature(Ljava/lang/String;Z)V

    .line 174
    :cond_b
    sget-object v1, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v2, "--ignorable"

    invoke-static {v1, v2}, Lorg/ccil/cowan/tagsoup/CommandLine;->hasOption(Ljava/util/Hashtable;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 175
    const-string v1, "http://www.ccil.org/~cowan/tagsoup/features/ignorable-whitespace"

    invoke-interface {v0, v1, v3}, Lorg/xml/sax/XMLReader;->setFeature(Ljava/lang/String;Z)V

    .line 178
    :cond_c
    sget-object v1, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v2, "--pyxin"

    invoke-static {v1, v2}, Lorg/ccil/cowan/tagsoup/CommandLine;->hasOption(Ljava/util/Hashtable;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 179
    new-instance v1, Lorg/ccil/cowan/tagsoup/PYXScanner;

    invoke-direct {v1}, Lorg/ccil/cowan/tagsoup/PYXScanner;-><init>()V

    const-string v2, "http://www.ccil.org/~cowan/tagsoup/properties/scanner"

    invoke-interface {v0, v2, v1}, Lorg/xml/sax/XMLReader;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 183
    :cond_d
    sget-object v1, Lorg/ccil/cowan/tagsoup/CommandLine;->theOutputEncoding:Ljava/lang/String;

    if-nez v1, :cond_e

    .line 184
    new-instance v1, Ljava/io/OutputStreamWriter;

    invoke-direct {v1, p1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    goto :goto_2

    .line 187
    :cond_e
    new-instance v1, Ljava/io/OutputStreamWriter;

    sget-object v2, Lorg/ccil/cowan/tagsoup/CommandLine;->theOutputEncoding:Ljava/lang/String;

    invoke-direct {v1, p1, v2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 189
    :goto_2
    invoke-static {v1}, Lorg/ccil/cowan/tagsoup/CommandLine;->chooseContentHandler(Ljava/io/Writer;)Lorg/xml/sax/ContentHandler;

    move-result-object p1

    .line 190
    invoke-interface {v0, p1}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 191
    sget-object v1, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v2, "--lexical"

    invoke-static {v1, v2}, Lorg/ccil/cowan/tagsoup/CommandLine;->hasOption(Ljava/util/Hashtable;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_f

    instance-of v1, p1, Lorg/xml/sax/ext/LexicalHandler;

    if-eqz v1, :cond_f

    .line 192
    const-string v1, "http://xml.org/sax/properties/lexical-handler"

    invoke-interface {v0, v1, p1}, Lorg/xml/sax/XMLReader;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 194
    :cond_f
    new-instance p1, Lorg/xml/sax/InputSource;

    invoke-direct {p1}, Lorg/xml/sax/InputSource;-><init>()V

    .line 195
    const-string v1, ""

    if-eq p0, v1, :cond_10

    .line 196
    invoke-virtual {p1, p0}, Lorg/xml/sax/InputSource;->setSystemId(Ljava/lang/String;)V

    goto :goto_3

    .line 199
    :cond_10
    sget-object p0, Ljava/lang/System;->in:Ljava/io/InputStream;

    invoke-virtual {p1, p0}, Lorg/xml/sax/InputSource;->setByteStream(Ljava/io/InputStream;)V

    .line 201
    :goto_3
    sget-object p0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    const-string v1, "--encoding="

    invoke-static {p0, v1}, Lorg/ccil/cowan/tagsoup/CommandLine;->hasOption(Ljava/util/Hashtable;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_11

    .line 203
    sget-object p0, Lorg/ccil/cowan/tagsoup/CommandLine;->options:Ljava/util/Hashtable;

    invoke-virtual {p0, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_11

    .line 204
    invoke-virtual {p1, p0}, Lorg/xml/sax/InputSource;->setEncoding(Ljava/lang/String;)V

    .line 206
    :cond_11
    invoke-interface {v0, p1}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V

    return-void
.end method
