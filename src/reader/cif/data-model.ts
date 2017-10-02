/*
 * Copyright (c) 2017 molio contributors, licensed under MIT, See LICENSE file for more info.
 *
 * @author David Sehnal <david.sehnal@gmail.com>
 */

import * as Column from '../common/column'

export interface File {
    readonly name?: string,
    readonly blocks: ReadonlyArray<Block>
}

export function File(blocks: ArrayLike<Block>, name?: string): File {
    return { name, blocks: blocks as any };
}

export interface Block {
    readonly header: string,
    readonly categories: { readonly [name: string]: Category }
}

export function Block(categories: { readonly [name: string]: Category }, header: string): Block {
    return { header, categories };
}

export interface Category {
    readonly rowCount: number,
    getField(name: string): Field | undefined
}

export function Category(rowCount: number, fields: { [name: string]: Field }): Category {
    return { rowCount, getField(name) { return fields[name]; } };
}

export namespace Category {
    export const Empty: Category = { rowCount: 0, getField(name: string) { return void 0; } };
}

export const enum ValuePresence {
    Present = 0,
    NotSpecified = 1,
    Unknown = 2
}

/**
 * Implementation note:
 * Always implement this as a "plain" object so that the functions are "closures"
 * by default. This is to ensure that the schema access works without definiting
 * additional closures.
 */
export interface Field {
    readonly isDefined: boolean,
    readonly rowCount: number,

    str(row: number): string,
    int(row: number): number,
    float(row: number): number,

    presence(row: number): ValuePresence,

    areValuesEqual(rowA: number, rowB: number): boolean,
    stringEquals(row: number, value: string): boolean,

    toStringArray(params?: Column.ToArrayParams): ReadonlyArray<string>,
    toIntArray(params?: Column.ToArrayParams): ReadonlyArray<number>,
    toFloatArray(params?: Column.ToArrayParams): ReadonlyArray<number>
}

export function DefaultUndefinedField(rowCount: number): Field {
    return {
        isDefined: false,
        rowCount,
        str: row => '',
        int: row => 0,
        float: row => 0,

        presence: row => ValuePresence.NotSpecified,
        areValuesEqual: (rowA, rowB) => true,
        stringEquals: (row, value) => value === null,

        toStringArray: (p) => Column.createArray(rowCount, p).array,
        toIntArray: (p) => Column.createArray(rowCount, p).array,
        toFloatArray: (p) => Column.createArray(rowCount, p).array
    };
}