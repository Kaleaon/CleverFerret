.class public Lcom/vladsch/flexmark/util/TemplateUtil;
.super Ljava/lang/Object;
.source "TemplateUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/util/TemplateUtil$Resolver;,
        Lcom/vladsch/flexmark/util/TemplateUtil$MappedResolver;
    }
.end annotation


# static fields
.field public static final NULL_RESOLVER:Lcom/vladsch/flexmark/util/TemplateUtil$Resolver;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 9
    new-instance v0, Lcom/vladsch/flexmark/util/TemplateUtil$1;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/TemplateUtil$1;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/util/TemplateUtil;->NULL_RESOLVER:Lcom/vladsch/flexmark/util/TemplateUtil$Resolver;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static resolveRefs(Ljava/lang/CharSequence;Ljava/util/regex/Pattern;Lcom/vladsch/flexmark/util/TemplateUtil$Resolver;)Ljava/lang/String;
    .locals 5

    .line 47
    const-string v0, ""

    if-nez p0, :cond_0

    return-object v0

    .line 49
    :cond_0
    invoke-virtual {p1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    .line 50
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 51
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 54
    :cond_1
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->groupCount()I

    move-result p0

    add-int/lit8 p0, p0, 0x1

    new-array v2, p0, [Ljava/lang/String;

    const/4 v3, 0x0

    :goto_0
    if-ge v3, p0, :cond_2

    .line 56
    invoke-virtual {p1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 59
    :cond_2
    invoke-interface {p2, v2}, Lcom/vladsch/flexmark/util/TemplateUtil$Resolver;->resolve([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_3

    move-object p0, v0

    goto :goto_1

    .line 61
    :cond_3
    const-string v2, "\\"

    const-string v3, "\\\\"

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v2, "$"

    const-string v3, "\\$"

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    :goto_1
    invoke-virtual {p1, v1, p0}, Ljava/util/regex/Matcher;->appendReplacement(Ljava/lang/StringBuffer;Ljava/lang/String;)Ljava/util/regex/Matcher;

    .line 62
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result p0

    if-nez p0, :cond_1

    .line 64
    invoke-virtual {p1, v1}, Ljava/util/regex/Matcher;->appendTail(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    .line 65
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 67
    :cond_4
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
