.class public Lorg/apache/commons/vfs2/PatternFileSelector;
.super Ljava/lang/Object;
.source "PatternFileSelector.java"

# interfaces
.implements Lorg/apache/commons/vfs2/FileSelector;


# instance fields
.field private final pattern:Ljava/util/regex/Pattern;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 48
    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/PatternFileSelector;-><init>(Ljava/util/regex/Pattern;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 61
    invoke-static {p1, p2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/PatternFileSelector;-><init>(Ljava/util/regex/Pattern;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/regex/Pattern;)V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lorg/apache/commons/vfs2/PatternFileSelector;->pattern:Ljava/util/regex/Pattern;

    return-void
.end method


# virtual methods
.method public includeFile(Lorg/apache/commons/vfs2/FileSelectInfo;)Z
    .locals 1

    .line 72
    iget-object v0, p0, Lorg/apache/commons/vfs2/PatternFileSelector;->pattern:Ljava/util/regex/Pattern;

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileSelectInfo;->getFile()Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileName;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/regex/Matcher;->matches()Z

    move-result p1

    return p1
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 77
    iget-object v0, p0, Lorg/apache/commons/vfs2/PatternFileSelector;->pattern:Ljava/util/regex/Pattern;

    invoke-virtual {v0}, Ljava/util/regex/Pattern;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public traverseDescendents(Lorg/apache/commons/vfs2/FileSelectInfo;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method
