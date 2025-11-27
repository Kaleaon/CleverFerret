.class public final enum Lcom/flyersoft/books/chmlib/XMLNode$Tag;
.super Ljava/lang/Enum;
.source "XMLNode.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/books/chmlib/XMLNode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Tag"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/flyersoft/books/chmlib/XMLNode$Tag;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/flyersoft/books/chmlib/XMLNode$Tag;

.field public static final enum body:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

.field public static final enum head:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

.field public static final enum html:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

.field public static final enum li:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

.field public static final enum meta:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

.field public static final enum object:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

.field public static final enum param:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

.field public static tagMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/flyersoft/books/chmlib/XMLNode$Tag;",
            ">;"
        }
    .end annotation
.end field

.field public static final enum ul:Lcom/flyersoft/books/chmlib/XMLNode$Tag;


# instance fields
.field public childTags:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/flyersoft/books/chmlib/XMLNode$Tag;",
            ">;"
        }
    .end annotation
.end field

.field public isSimple:Z


# direct methods
.method private static synthetic $values()[Lcom/flyersoft/books/chmlib/XMLNode$Tag;
    .locals 3

    const/16 v0, 0x8

    .line 13
    new-array v0, v0, [Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    sget-object v1, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->param:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->object:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->li:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->ul:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->body:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->meta:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->head:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->html:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 8

    .line 14
    new-instance v0, Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    const/4 v1, 0x0

    new-array v2, v1, [Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    const-string v3, "param"

    const/4 v4, 0x1

    invoke-direct {v0, v3, v1, v4, v2}, Lcom/flyersoft/books/chmlib/XMLNode$Tag;-><init>(Ljava/lang/String;IZ[Lcom/flyersoft/books/chmlib/XMLNode$Tag;)V

    sput-object v0, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->param:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    .line 15
    new-instance v2, Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    new-array v3, v4, [Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    aput-object v0, v3, v1

    const-string v0, "object"

    invoke-direct {v2, v0, v4, v1, v3}, Lcom/flyersoft/books/chmlib/XMLNode$Tag;-><init>(Ljava/lang/String;IZ[Lcom/flyersoft/books/chmlib/XMLNode$Tag;)V

    sput-object v2, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->object:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    .line 16
    new-instance v0, Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    new-array v3, v4, [Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    aput-object v2, v3, v1

    const-string v5, "li"

    const/4 v6, 0x2

    invoke-direct {v0, v5, v6, v1, v3}, Lcom/flyersoft/books/chmlib/XMLNode$Tag;-><init>(Ljava/lang/String;IZ[Lcom/flyersoft/books/chmlib/XMLNode$Tag;)V

    sput-object v0, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->li:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    .line 17
    new-instance v3, Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    new-array v5, v4, [Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    aput-object v0, v5, v1

    const-string v0, "ul"

    const/4 v7, 0x3

    invoke-direct {v3, v0, v7, v1, v5}, Lcom/flyersoft/books/chmlib/XMLNode$Tag;-><init>(Ljava/lang/String;IZ[Lcom/flyersoft/books/chmlib/XMLNode$Tag;)V

    sput-object v3, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->ul:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    .line 18
    new-instance v0, Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    new-array v5, v6, [Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    aput-object v2, v5, v1

    aput-object v3, v5, v4

    const-string v2, "body"

    const/4 v3, 0x4

    invoke-direct {v0, v2, v3, v1, v5}, Lcom/flyersoft/books/chmlib/XMLNode$Tag;-><init>(Ljava/lang/String;IZ[Lcom/flyersoft/books/chmlib/XMLNode$Tag;)V

    sput-object v0, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->body:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    .line 20
    new-instance v2, Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    const/4 v3, 0x5

    new-array v5, v1, [Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    const-string v7, "meta"

    invoke-direct {v2, v7, v3, v4, v5}, Lcom/flyersoft/books/chmlib/XMLNode$Tag;-><init>(Ljava/lang/String;IZ[Lcom/flyersoft/books/chmlib/XMLNode$Tag;)V

    sput-object v2, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->meta:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    .line 21
    new-instance v3, Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    new-array v5, v4, [Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    aput-object v2, v5, v1

    const-string v2, "head"

    const/4 v7, 0x6

    invoke-direct {v3, v2, v7, v1, v5}, Lcom/flyersoft/books/chmlib/XMLNode$Tag;-><init>(Ljava/lang/String;IZ[Lcom/flyersoft/books/chmlib/XMLNode$Tag;)V

    sput-object v3, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->head:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    .line 22
    new-instance v2, Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    new-array v5, v6, [Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    aput-object v3, v5, v1

    aput-object v0, v5, v4

    const-string v0, "html"

    const/4 v3, 0x7

    invoke-direct {v2, v0, v3, v1, v5}, Lcom/flyersoft/books/chmlib/XMLNode$Tag;-><init>(Ljava/lang/String;IZ[Lcom/flyersoft/books/chmlib/XMLNode$Tag;)V

    sput-object v2, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->html:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    .line 13
    invoke-static {}, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->$values()[Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->$VALUES:[Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    .line 46
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->tagMap:Ljava/util/Map;

    return-void
.end method

.method private varargs constructor <init>(Ljava/lang/String;IZ[Lcom/flyersoft/books/chmlib/XMLNode$Tag;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000,
            0x0,
            0x0
        }
        names = {
            null,
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z[",
            "Lcom/flyersoft/books/chmlib/XMLNode$Tag;",
            ")V"
        }
    .end annotation

    .line 28
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 29
    iput-boolean p3, p0, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->isSimple:Z

    .line 30
    new-instance p1, Ljava/util/HashSet;

    invoke-static {p4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    iput-object p1, p0, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->childTags:Ljava/util/Set;

    return-void
.end method

.method public static fixDependancy()V
    .locals 6

    .line 39
    sget-object v0, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->li:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    iget-object v0, v0, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->childTags:Ljava/util/Set;

    sget-object v1, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->ul:Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 40
    iget-object v0, v1, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->childTags:Ljava/util/Set;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 41
    invoke-static {}, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->values()[Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 42
    sget-object v4, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->tagMap:Ljava/util/Map;

    invoke-virtual {v3}, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->name()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public static getByValue(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/XMLNode$Tag;
    .locals 1

    .line 53
    sget-object v0, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->tagMap:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/XMLNode$Tag;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 13
    const-class v0, Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    return-object p0
.end method

.method public static values()[Lcom/flyersoft/books/chmlib/XMLNode$Tag;
    .locals 1

    .line 13
    sget-object v0, Lcom/flyersoft/books/chmlib/XMLNode$Tag;->$VALUES:[Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    invoke-virtual {v0}, [Lcom/flyersoft/books/chmlib/XMLNode$Tag;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/books/chmlib/XMLNode$Tag;

    return-object v0
.end method
