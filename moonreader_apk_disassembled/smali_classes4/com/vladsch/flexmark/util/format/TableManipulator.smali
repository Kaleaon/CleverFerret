.class public interface abstract Lcom/vladsch/flexmark/util/format/TableManipulator;
.super Ljava/lang/Object;
.source "TableManipulator.java"


# static fields
.field public static final NULL:Lcom/vladsch/flexmark/util/format/TableManipulator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 8
    new-instance v0, Lcom/vladsch/flexmark/util/format/TableManipulator$1;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/format/TableManipulator$1;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/util/format/TableManipulator;->NULL:Lcom/vladsch/flexmark/util/format/TableManipulator;

    return-void
.end method


# virtual methods
.method public abstract apply(Lcom/vladsch/flexmark/util/format/MarkdownTable;Lcom/vladsch/flexmark/util/ast/Node;)V
.end method
