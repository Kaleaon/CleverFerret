.class public Lcom/vladsch/flexmark/ext/tables/TableTextCollectingVisitor;
.super Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;
.source "TableTextCollectingVisitor.java"


# static fields
.field public static final TABLE_LINE_BREAK_CLASSES:[Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x3

    .line 6
    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Lcom/vladsch/flexmark/ext/tables/TableBlock;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-class v1, Lcom/vladsch/flexmark/ext/tables/TableRow;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const-class v1, Lcom/vladsch/flexmark/ext/tables/TableCaption;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/TableTextCollectingVisitor;->TABLE_LINE_BREAK_CLASSES:[Ljava/lang/Class;

    return-void
.end method

.method public varargs constructor <init>([Ljava/lang/Class;)V
    .locals 3

    .line 10
    array-length v0, p1

    if-nez v0, :cond_0

    sget-object p1, Lcom/vladsch/flexmark/ext/tables/TableTextCollectingVisitor;->TABLE_LINE_BREAK_CLASSES:[Ljava/lang/Class;

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    new-array v0, v0, [[Ljava/lang/Class;

    sget-object v1, Lcom/vladsch/flexmark/ext/tables/TableTextCollectingVisitor;->TABLE_LINE_BREAK_CLASSES:[Ljava/lang/Class;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const/4 v1, 0x1

    aput-object p1, v0, v1

    invoke-static {v0}, Lcom/vladsch/flexmark/ext/tables/TableTextCollectingVisitor;->concatArrays([[Ljava/lang/Class;)[Ljava/lang/Class;

    move-result-object p1

    :goto_0
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;-><init>([Ljava/lang/Class;)V

    return-void
.end method
